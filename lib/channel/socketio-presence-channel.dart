import './index.dart';

class SocketIoPresenceChannel extends SocketIoChannel
    implements PresenceChannel {
  SocketIoPresenceChannel(socket, String name, Map options)
      : super(socket, name, options);

  @override
  SocketIoPresenceChannel here(Function callback) {
    this.on("presence:subscribed",
        (List<dynamic> members) => callback((members.map((e) => e.user_info))));

    return this;
  }

  @override
  SocketIoPresenceChannel joining(Function callback) {
    this.on("presence:joining",
        (dynamic members) => callback((members.map((e) => e.user_info))));

    return this;
  }

  @override
  SocketIoPresenceChannel leaving(Function callback) {
    this.on("presence:leaving",
        (dynamic members) => callback((members.map((e) => e.user_info))));

    return this;
  }
}
