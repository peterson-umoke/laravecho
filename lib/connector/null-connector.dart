import 'package:laravel_echo_pusher/channel/index.dart';
import 'package:laravel_echo_pusher/connector/index.dart';

class NullConnector extends Connector {
  NullConnector(Map<String, dynamic> options) : super(options);

  dynamic channels = {};

  @override
  void connect() {}

  NullChannel listen(String name, String event, Function callback) =>
      new NullChannel();

  @override
  NullChannel channel(String channel) => new NullChannel();

  @override
  NullPrivateChannel privateChannel(String channel) => new NullPrivateChannel();

  @override
  NullPresenceChannel presenceChannel(String channel) =>
      new NullPresenceChannel();

  @override
  void leave(String channel) {}

  @override
  void leaveChannel(String channel) {}

  @override
  String socketId() => "fake-socket-id";

  @override
  void disconnect() {}
}
