import 'package:laravecho/channel/index.dart';
import 'package:laravecho/connector/connector.dart';
import 'package:pusher_websocket_flutter/pusher.dart';

class PusherConnector extends Connector {
  dynamic pusher;

  Map channels = {};

  PusherConnector(Map<String, dynamic> options) : super(options);

  @override
  Future<void> connect() async {
    if (this.options['client'] != null) {
      this.pusher = this.options['client'];
    } else {
      this.pusher = await Pusher.init(
          this.options["key"], PusherOptions.fromJson(options));
    }
  }

  PusherChannel listen(String name, String event, Function callback) =>
      this.channel(name).listen(event, callback);

  @override
  PusherChannel channel(String name) {
    if (this.channels[name] != null) {
      this.channels[name] = new PusherChannel(this.pusher, name, this.options);
    }

    return this.channels[name];
  }

  @override
  PusherPrivateChannel privateChannel(String name) {
    if (this.channels['private-' + name] != null) {
      this.channels['private-' + name] = new PusherPrivateChannel(
          this.pusher, 'private-' + name, this.options);
    }

    return this.channels['private-' + name];
  }

  PusherPrivateChannel encryptedPrivateChannel(String name) {
    if (this.channels['private-encrypted-' + name] != null) {
      this.channels['private-encrypted-' + name] =
          new PusherEncryptedPrivateChannel(
              this.pusher, 'private-encrypted-' + name, this.options);
    }

    return this.channels['private-encrypted-' + name];
  }

  @override
  PusherPresenceChannel presenceChannel(String name) {
    if (this.channels['presence-' + name] != null) {
      this.channels['presence-' + name] = new PusherPresenceChannel(
          this.pusher, 'presence-' + name, this.options);
    }

    return this.channels['presence-' + name];
  }

  @override
  void leave(String name) {
    List channels = [name, 'private-$name', 'presence-$name'];

    channels.forEach((dynamic name) {
      this.leaveChannel(name);
    });
  }

  @override
  void leaveChannel(String name) {
    if (name != null) {
      this.channels[name].unsubscribe();
      this.channels.remove(name);
    }
  }

  @override
  String socketId() => this.pusher.connection.socket_id;

  @override
  void disconnect() => this.pusher.disconnect();
}
