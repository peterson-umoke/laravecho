import 'package:laravel_echo_pusher/channel/index.dart';
import 'package:laravel_echo_pusher/connector/index.dart';

class NullConnector extends Connector {
  NullConnector(Map<String, dynamic> options) : super(options);

  Map channels = {};

  @override
  void connect() {}

  NullChannel listen(String name, String event, Function callback) =>
      new NullChannel();

  @override
  NullChannel channel(String name) => new NullChannel();

  @override
  NullPrivateChannel privateChannel(String name) => new NullPrivateChannel();

  @override
  NullPresenceChannel presenceChannel(String name) => new NullPresenceChannel();

  @override
  void leave(String name) {}

  @override
  void leaveChannel(String name) {}

  @override
  String socketId() => "fake-socket-id";

  @override
  void disconnect() {}
}
