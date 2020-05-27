import './../util/index.dart';
import './index.dart';

class SocketIoChannel extends Channel {
  /// The Socket.io client instance.
  dynamic socket;

  /// The name of the channel.
  dynamic name;

  /// Channel options.
  Map options;

  /// The event formatter.
  EventFormatter eventFormatter;

  /// The subscription of the channel.
  dynamic subscription;

  /// The event callbacks applied to the channel.
  Map events = {};

  /// Create a new class instance.
  SocketIoChannel(dynamic socket, String name, Map options) : super() {
    this.name = name;
    this.socket = socket;
    this.options = options;
    this.eventFormatter = new EventFormatter(this.options["namespace"]);

    this.subscribe();
    this.configureReconnector();
  }

  /// Subscribe to a Socket.io channel.
  void subscribe() {
    this.socket.emit("subscribe", {
      "channel": this.name,
      "auth": this.options["auth"] ?? {},
    });
  }

  /// Subscribe to a Socket.io channel.
  void unsubscribe() {
    this.unbind();

    this.socket.emit("unsubscribe", {
      "channel": this.name,
      "auth": this.options["auth"] ?? {},
    });
  }

  @override
  SocketIoChannel listen(String event, Function callback) {
    this.on(this.eventFormatter.format(event), callback);

    return this;
  }

  @override
  SocketIoChannel stopListening(String event) {
    var name = this.eventFormatter.format(event);
    this.socket.off(name);
    this.events.remove(name);

    return this;
  }

  void on(String event, Function callback) {
    var listener = (data) {
      if (this.name == data[0]) {
        callback(data[1]);
      }
    };

    this.socket.on(event, listener);
    this.bind(event, listener);
  }

  void configureReconnector() {
    var listener = (_) => this.subscribe();

    this.socket.on('reconnect', listener);
    this.bind('reconnect', listener);
  }

  void bind(String event, Function callback) {
    this.events[event] = this.events[event] ?? [];
    this.events[event].push(callback);
  }

  void unbind() {
    this.events.keys.forEach((event) {
      this.events[event].forEach((callback) {
        this.socket.off(event, callback);
      });

      this.events[event] = null;
    });
  }
}
