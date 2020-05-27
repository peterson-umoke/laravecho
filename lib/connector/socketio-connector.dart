import 'package:laravel_echo_pusher/channel/index.dart';
import 'package:laravel_echo_pusher/connector/index.dart';

class SocketIoConnector extends Connector {
  SocketIoConnector(Map<String, dynamic> options) : super(options);

  @override
  void connect() {}

  SocketIoChannel listen(String name, String event, Function callback) =>
      new SocketIoChannel();

  @override
  SocketIoChannel channel(String name) => new SocketIoChannel();

  @override
  SocketIoPrivateChannel privateChannel(String name) =>
      new SocketIoPrivateChannel();

  @override
  SocketIoPresenceChannel presenceChannel(String name) =>
      new SocketIoPresenceChannel();

  @override
  void leave(String name) {}

  @override
  void leaveChannel(String name) {}

  @override
  String socketId() => "fake-socket-id";

  @override
  void disconnect() {}
}
