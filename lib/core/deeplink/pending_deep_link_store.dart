import 'package:fintech/core/deeplink/deep_link_target.dart';
import 'package:injectable/injectable.dart';

/// Holds a deeplink while the user completes login so notification data is not lost.
@lazySingleton
class PendingDeepLinkStore {
  DeepLinkTarget? _pending;

  DeepLinkTarget? get pending => _pending;

  bool get hasPending => _pending != null;

  void save(DeepLinkTarget target) {
    _pending = target;
  }

  /// Returns and clears the stored target (one-shot).
  DeepLinkTarget? consume() {
    final DeepLinkTarget? target = _pending;
    _pending = null;
    return target;
  }

  void clear() => _pending = null;
}
