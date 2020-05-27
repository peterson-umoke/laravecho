import 'index.dart';

class SocketIoPrivateChannel extends SocketIoChannel {
  SocketIoPrivateChannel(socket, String name, Map options)
      : super(socket, name, options);

  /// Trigger client event on the channel.
  SocketIoChannel whisper(eventName, data) {
    this.socket.emit('client event', {
      "channel": this.name,
      "event": 'client-$eventName',
      "data": data,
    });

    return this;
  }
}
