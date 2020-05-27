/// Event name formatter
class EventFormatter {
  /// Event namespace.
  String namespace;

  /// Create a new class instance.
  EventFormatter(String namespace) {
    this.namespace = namespace;
  }

  /// Format the given event name.
  String format(String event) {
    if (event.startsWith(".") || event.startsWith("\\")) {
      return event.substring(1);
    } else if (this.namespace != null) {
      event = this.namespace + "." + event;
    }

    return event.replaceAll(".", "\\");
  }

  /// Set the event namespace.
  void setNamespace(String value) {
    this.namespace = value != null ? value : false;
  }
}
