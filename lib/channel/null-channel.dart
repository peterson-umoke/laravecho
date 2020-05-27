import './index.dart';

/// This class represents a null channel.
class NullChannel extends Channel {
  /// Subscribe to a channel.
  dynamic subscribe() {}

  /// Unsubscribe from a channel.
  void unsubscribe() {}

  /// Listen for an event on the channel instance.
  @override
  NullChannel listen(String event, Function callback) => this;

  /// Stop listening for an event on the channel instance.
  @override
  NullChannel stopListening(String event) => this;

  /// Bind a channel to an event.
  NullChannel on(String event, Function callback) => this;
}
