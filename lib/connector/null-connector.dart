import 'package:laravel_echo_pusher/channel/channel.dart';
import 'package:laravel_echo_pusher/channel/presence-channel.dart';
import 'package:laravel_echo_pusher/connector/index.dart';

class NullConnector extends Connector {
  NullConnector(Map<String, dynamic> options) : super(options);

  @override
  Channel channel(String channel) {
    // TODO: implement channel
    throw UnimplementedError();
  }

  @override
  void connect() {
    // TODO: implement connect
  }

  @override
  void disconnect() {
    // TODO: implement disconnect
  }

  @override
  void leave(String channel) {
    // TODO: implement leave
  }

  @override
  void leaveChannel(String channel) {
    // TODO: implement leaveChannel
  }

  @override
  PresenceChannel presenceChannel(String channel) {
    // TODO: implement presenceChannel
    throw UnimplementedError();
  }

  @override
  Channel privateChannel(String channel) {
    // TODO: implement privateChannel
    throw UnimplementedError();
  }

  @override
  String socketId() {
    // TODO: implement socketId
    throw UnimplementedError();
  }
}
