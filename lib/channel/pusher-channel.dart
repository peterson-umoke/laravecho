import './../util/event-formatter.dart';
import './index.dart';

/// This class represents a Pusher channel.
class PusherChannel extends Channel {
  /// The Pusher client instance.
  dynamic pusher;

  /// The name of the channel.
  dynamic name;

  /// Channel options.
  Map<String, dynamic> options;

  /// The event formatter.
  EventFormatter eventFormatter;

  /// The subscription of the channel.
  dynamic subscription;

  /// Create a new class instance.
  PusherChannel(dynamic pusher, dynamic name, Map<String, dynamic> options)
      : super() {
    this.name = name;
    this.pusher = pusher;
    this.options = options;
    this.eventFormatter = new EventFormatter(this.options["namespace"]);

    this.subscribe();
  }

  /// Subscribe to a Pusher channel.
  dynamic subscribe() => this.subscription = this.pusher.subscribe(this.name);

  /// Unsubscribe from a Pusher channel.
  dynamic unsubscribe() =>
      this.subscription = this.pusher.unsubscribe(this.name);

  /// Listen for an event on the channel instance.
  @override
  PusherChannel listen(String event, Function callback) {
    this.on(this.eventFormatter.format(event), callback);

    return this;
  }

  /// Stop listening for an event on the channel instance.
  @override
  PusherChannel stopListening(String event) {
    this.subscription.unbind(this.eventFormatter.format(event));

    return this;
  }

  /// Bind a channel to an event.
  PusherChannel on(String event, Function callback) {
    this.subscription.bind(event, callback);

    return this;
  }
}
