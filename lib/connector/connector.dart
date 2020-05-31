import 'package:flutter/cupertino.dart';

import '../channel/index.dart';

abstract class Connector {
  Map _defaultOptions = {
    "auth": {
      "headers": {},
    },
    "authEndpoint": '/broadcasting/auth',
    "broadcaster": 'pusher',
    "csrfToken": null,
    "host": null,
    "key": null,
    "namespace": 'App.Events',
  };

  /// Connector options.
  Map options;

  /// Create a new class instance.
  Connector(Map<String, dynamic> options) {
    this.setOptions(options);
    this.connect();
  }

  @protected
  dynamic setOptions(Map options) {
    _defaultOptions.addAll(options);
    this.options = this._defaultOptions;

    if (this._csrfToken() != null) {
      this.options['auth'].headers['X-CSRF-TOKEN'] = this._csrfToken();
    }
  }

  /// Extract the CSRF token from the page.
  @protected
  String _csrfToken() {
    if (this.options['csrfToken'] != null) {
      return this.options['csrfToken'];
    }

    return null;
  }

  /// Create a fresh connection.
  void connect();

  /// Get a channel instance by name.
  Channel channel(String channel);

  /// Get a private channel instance by name.
  Channel privateChannel(String channel);

  /// Get a presence channel instance by name.
  PresenceChannel presenceChannel(String channel);

  /// Leave the given channel, as well as its private and presence variants.
  void leave(String channel);

  /// Leave the given channel.
  void leaveChannel(String channel);

  /// Get the socket_id of the connection.
  String socketId();

  /// Disconnect from the Echo server.
  void disconnect();
}
