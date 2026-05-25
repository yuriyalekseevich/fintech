import 'package:fintech/core/deeplink/deep_link_target.dart';
import 'package:fintech/core/router/deep_link_security.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeepLinkParser {
  static const String scheme = 'fintech';
  static const String transactionsHost = 'transactions';
  static const String cardsHost = 'cards';
  static const String accountsHost = 'accounts';

  static String transactionDetailsUri(String transactionId) =>
      '$scheme://$transactionsHost/$transactionId';

  static String cardDetailsUri(String cardId) =>
      '$scheme://$cardsHost/$cardId';

  static String accountDetailsUri(String accountId) =>
      '$scheme://$accountsHost/$accountId';

  DeepLinkTarget? parseUri(Uri uri) {
    if (uri.scheme != scheme) {
      return null;
    }

    if (uri.host.isNotEmpty) {
      final String? id = _firstPathSegment(uri);
      final DeepLinkTarget? fromHost = _targetFromHost(uri.host, id);
      if (fromHost != null) {
        return fromHost;
      }
    }

    final List<String> segments = uri.pathSegments;
    if (segments.length >= 2) {
      return _targetFromHost(segments.first, segments[1]);
    }

    return null;
  }

  DeepLinkTarget? parseNotificationPayload(Map<String, Object?> payload) {
    final Object? deeplink = payload['deeplink'];
    if (deeplink is String && deeplink.isNotEmpty) {
      final DeepLinkTarget? fromUri = parseUri(Uri.parse(deeplink));
      if (fromUri != null) {
        return fromUri;
      }
    }

    final Object? transactionId = payload['transaction_id'];
    if (transactionId is String &&
        DeepLinkSecurity.isValidTransactionId(transactionId)) {
      return TransactionDetailsDeepLink(transactionId);
    }

    final Object? cardId = payload['card_id'];
    if (cardId is String && DeepLinkSecurity.isValidCardId(cardId)) {
      return CardDetailsDeepLink(cardId);
    }

    final Object? accountId = payload['account_id'];
    if (accountId is String && DeepLinkSecurity.isValidAccountId(accountId)) {
      return AccountDetailsDeepLink(accountId);
    }

    final Object? ticketId = payload['ticket_id'];
    final String? fromTicket = _transactionIdFromTicket(ticketId);
    if (fromTicket != null) {
      return TransactionDetailsDeepLink(fromTicket);
    }

    final Object? clickAction = payload['click_action'];
    final DeepLinkTarget? fromClickAction = _targetFromClickAction(clickAction);
    if (fromClickAction != null) {
      return fromClickAction;
    }

    return null;
  }

  DeepLinkTarget? _targetFromHost(String host, String? id) {
    if (id == null) {
      return null;
    }

    return switch (host) {
      transactionsHost when DeepLinkSecurity.isValidTransactionId(id) =>
        TransactionDetailsDeepLink(id),
      cardsHost when DeepLinkSecurity.isValidCardId(id) => CardDetailsDeepLink(id),
      accountsHost when DeepLinkSecurity.isValidAccountId(id) =>
        AccountDetailsDeepLink(id),
      _ => null,
    };
  }

  DeepLinkTarget? _targetFromClickAction(Object? clickAction) {
    if (clickAction is! String || clickAction.isEmpty) {
      return null;
    }

    final RegExpMatch? transactionMatch = RegExp(
      r'^/transactions/([^/]+)/?$',
    ).firstMatch(clickAction);
    final String? transactionId = transactionMatch?.group(1);
    if (transactionId != null &&
        DeepLinkSecurity.isValidTransactionId(transactionId)) {
      return TransactionDetailsDeepLink(transactionId);
    }

    final RegExpMatch? cardMatch = RegExp(r'^/cards/([^/]+)/?$').firstMatch(
      clickAction,
    );
    final String? cardId = cardMatch?.group(1);
    if (cardId != null && DeepLinkSecurity.isValidCardId(cardId)) {
      return CardDetailsDeepLink(cardId);
    }

    final RegExpMatch? accountMatch = RegExp(
      r'^/accounts/([^/]+)/?$',
    ).firstMatch(clickAction);
    final String? accountId = accountMatch?.group(1);
    if (accountId != null && DeepLinkSecurity.isValidAccountId(accountId)) {
      return AccountDetailsDeepLink(accountId);
    }

    return null;
  }

  String? _transactionIdFromTicket(Object? ticketId) {
    if (ticketId is! String || ticketId.isEmpty) {
      return null;
    }
    if (DeepLinkSecurity.isValidTransactionId(ticketId)) {
      return ticketId;
    }
    final String prefixed = 'tx-$ticketId';
    if (DeepLinkSecurity.isValidTransactionId(prefixed)) {
      return prefixed;
    }
    return null;
  }

  String? _firstPathSegment(Uri uri) {
    if (uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.first;
    }
    final String path = uri.path;
    if (path.length > 1) {
      return path.substring(1).split('/').first;
    }
    return null;
  }
}
