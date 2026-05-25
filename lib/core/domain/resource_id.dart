/// Validates resource identifiers used in routes and API paths.
abstract final class ResourceId {
  static final RegExp _pattern = RegExp(r'^[a-zA-Z0-9_-]{1,64}$');

  static bool isValid(String id) => _pattern.hasMatch(id);
}
