library laravel_echo_pusher;

import './channel/index.dart';

/// This class is the primary API for interacting with broadcasting.
class Echo {
  /// The broadcasting connector
  dynamic connector;

  ///the Echo options
  dynamic options;

  /// Create a new class instance.
  Echo(Map<String, dynamic> options) {
    this.options = options;
    this.connect();

    if (!this.options.withoutInterceptors) {
      this.registerInterceptors();
    }
  }

  /// Get a channel instance by name.
  Channel channel(String channel) => this.connector.channel(channel);

  /// Create a new connection.
  void connect() {
    if (this.options.broadcaster == 'pusher') {
      this.connector = new PusherConnector(this.options);
    } else if (this.options.broadcaster == 'socket.io') {
      this.connector = new SocketIoConnector(this.options);
    } else if (this.options.broadcaster == 'null') {
      this.connector = new NullConnector(this.options);
    } else if (this.options.broadcaster is Function) {
      this.connector = this.options.broadcaster(this.options);
    }
  }

  /// Disconnect from the Echo server.
  void disconnect() => this.connector.disconnect();

  /// Get a presence channel instance by name.
  PresenceChannel join(String channel) =>
      this.connector.presenceChannel(channel);

  /// Leave the given channel, as well as its private and presence variants.
  void leave(String channel) => this.connector.leave(channel);

  /// Leave the given channel.
  void leaveChannel(String channel) => this.connector.leaveChannel(channel);

  /// Listen for an event on a channel instance.
  void listen(String channel, String event, Function function) =>
      this.connector.listen(channel, event, function);

  /// Get a private channel instance by name.
  Channel private(String channel) => this.connector.privateChannel(channel);

  /// Get a private encrypted channel instance by name.
  Channel encryptedPrivate(String channel) =>
      this.connector.encryptedPrivateChannel(channel);

  /// Get the Socket ID for the connection.
  String socketId() => this.connector.socketId();

  /// Register 3rd party request interceptors. These are used to automatically
  /// send a connections socket id to a Laravel app with a X-Socket-Id header.
  void registerInterceptors() {}
}

class NullConnector {
  NullConnector(options);
}

class SocketIoConnector {
  SocketIoConnector(options);
}

class PusherConnector {
  PusherConnector(options);
}
