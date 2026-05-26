import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/auth/presentation/bloc/auth_event.dart';
import 'package:fintech/features/cards/presentation/bloc/add_card_event.dart';

/// Formats bloc events, states, and nested payloads for debug console output.
abstract final class BlocLogFormatter {
  static const String _redacted = '***redacted***';
  static const int _maxCollectionItems = 20;

  static String describe(Object? value, {int indent = 0}) {
    if (value == null) {
      return 'null';
    }

    final String pad = '  ' * indent;

    return switch (value) {
      AuthLoginSubmitted(:final email) =>
        'AuthLoginSubmitted(email: $email, password: $_redacted)',
      AddCardSubmitted(
        :final cardNumber,
        :final expiryMonth,
        :final expiryYear,
        cvv: _,
        :final holderName,
        :final addressLine1,
        :final addressLine2,
        :final state,
        :final zipCode,
        :final currency,
        :final type,
      ) =>
        'AddCardSubmitted('
        'cardNumber: ${_maskCardNumber(cardNumber)}, '
        'expiry: $expiryMonth/$expiryYear, '
        'cvv: $_redacted, '
        'holderName: $holderName, '
        'addressLine1: $addressLine1, '
        'addressLine2: $addressLine2, '
        'state: $state, '
        'zipCode: $zipCode, '
        'currency: $currency, '
        'type: $type)',
      final List<dynamic> list => _formatList(list, indent: indent),
      final Map<dynamic, dynamic> map => _formatMap(map, indent: indent),
      final Failure failure => failure.toString(),
      _ => _formatDefault(value, indent: indent, pad: pad),
    };
  }

  static String _formatDefault(
    Object value, {
    required int indent,
    required String pad,
  }) {
    final String text = value.toString();
    if (!text.contains('\n')) {
      return text;
    }

    return text
        .split('\n')
        .map((String line) => '$pad$line')
        .join('\n');
  }

  static String _formatList(List<dynamic> list, {required int indent}) {
    if (list.isEmpty) {
      return '[]';
    }

    final String childPad = '  ' * (indent + 1);
    final int shown = list.length > _maxCollectionItems
        ? _maxCollectionItems
        : list.length;

    final StringBuffer buffer = StringBuffer('[\n');
    for (var i = 0; i < shown; i++) {
      buffer.writeln('$childPad${describe(list[i], indent: indent + 1)},');
    }

    if (list.length > shown) {
      buffer.writeln(
        '$childPad... +${list.length - shown} more',
      );
    }

    buffer.write('${'  ' * indent}]');
    return buffer.toString();
  }

  static String _formatMap(Map<dynamic, dynamic> map, {required int indent}) {
    if (map.isEmpty) {
      return '{}';
    }

    final String childPad = '  ' * (indent + 1);
    final StringBuffer buffer = StringBuffer('{\n');

    for (final MapEntry<dynamic, dynamic> entry in map.entries) {
      buffer.writeln(
        '$childPad${entry.key}: ${describe(entry.value, indent: indent + 1)},',
      );
    }

    buffer.write('${'  ' * indent}}');
    return buffer.toString();
  }

  static String _maskCardNumber(String cardNumber) {
    final String digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 4) {
      return '****';
    }
    return '****${digits.substring(digits.length - 4)}';
  }
}
