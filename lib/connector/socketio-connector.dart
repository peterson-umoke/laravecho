import 'package:laravel_echo_pusher/channel/index.dart';
import 'package:laravel_echo_pusher/connector/index.dart';

class SocketIoConnector extends Connector {
  dynamic socket;

  Map channels = {};

  SocketIoConnector(Map<String, dynamic> options) : super(options);

  @override
  void connect() {
    var io = this.getSocketIO();
    this.socket = io(this.options['host']);

    return this.socket;
  }

  dynamic getSocketIO() {
    //

    if (this.options['client'] != null) {
      //
    } else if (this.options['client'] == null) {
      //
    }

    throw new Error();
  }

//  SocketIoChannel listen(String name, String event, Function callback) =>
//      new SocketIoChannel();
//
//  @override
//  SocketIoChannel channel(String name) => new SocketIoChannel();
//
//  @override
//  SocketIoPrivateChannel privateChannel(String name) =>
//      new SocketIoPrivateChannel();
//
//  @override
//  SocketIoPresenceChannel presenceChannel(String name) =>
//      new SocketIoPresenceChannel();

  @override
  void leave(String name) {}

  @override
  void leaveChannel(String name) {}

  @override
  String socketId() => "fake-socket-id";

  @override
  void disconnect() {}
}
