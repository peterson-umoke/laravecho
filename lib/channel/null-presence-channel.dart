import './index.dart';

/// This class represents a null presence channel.
class NullPresenceChannel extends NullChannel implements PresenceChannel {
  /// Register a callback to be called anytime the member list changes.
  @override
  NullPresenceChannel here(Function callback) => this;

  /// Listen for someone joining the channel.
  @override
  NullPresenceChannel joining(Function callback) => this;

  /// Listen for someone leaving the channel.
  @override
  NullPresenceChannel leaving(Function callback) => this;

  /// Trigger client event on the channel.
  NullPresenceChannel whisper(String eventName, dynamic data) => this;
}
