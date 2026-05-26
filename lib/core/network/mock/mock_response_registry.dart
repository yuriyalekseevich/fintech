import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/core/network/mock/mock_account_details.dart';
import 'package:fintech/core/network/mock/mock_accounts_store.dart';
import 'package:fintech/core/network/mock/mock_card_details.dart';
import 'package:fintech/core/network/mock/mock_cards_store.dart';
import 'package:fintech/core/network/mock/mock_transaction_details.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

/// Registers all mock HTTP responses. Mock data lives here only — never in repositories.
abstract final class MockResponseRegistry {
  static const Map<String, dynamic> _validLoginBody = <String, dynamic>{
    'email': 'demo@fintech.app',
    'password': 'password',
  };

  static void register(DioAdapter adapter) {
    _registerAuth(adapter);
    _registerFeatureStubs(adapter);
  }

  static void _registerAuth(DioAdapter adapter) {
    adapter.onPost(
      ApiEndpoints.login,
      (server) => server.reply(
        200,
        <String, Object>{
          'accessToken': 'mock_access_token_initial',
          'refreshToken': 'mock_refresh_token_stable',
          'expiresIn': 3600,
        },
        delay: const Duration(milliseconds: 400),
      ),
      data: _validLoginBody,
    );

    adapter.onPost(
      ApiEndpoints.login,
      (server) => server.reply(
        401,
        <String, Object>{'error': 'Invalid email or password'},
        delay: const Duration(milliseconds: 400),
      ),
    );

    adapter.onPost(
      ApiEndpoints.refreshToken,
      (server) => server.reply(
        200,
        <String, Object>{
          'accessToken': 'mock_access_token_refreshed',
          'refreshToken': 'mock_refresh_token_stable',
          'expiresIn': 3600,
        },
        delay: const Duration(milliseconds: 300),
      ),
    );

    adapter.onPost(
      ApiEndpoints.logout,
      (server) => server.reply(
        200,
        <String, String>{'message': 'Logged out'},
        delay: const Duration(milliseconds: 200),
      ),
    );
  }

  static void _registerTransactions(DioAdapter adapter) {
    adapter.onGet(
      ApiEndpoints.transactions,
      (server) => server.reply(
        200,
        <String, Object>{
          'transactions': MockTransactionDetails.transactionsList,
        },
      ),
    );

    for (final Map<String, Object> summary
        in MockTransactionDetails.transactionsList) {
      final String id = summary['id']! as String;
      adapter.onGet(
        ApiEndpoints.transactionDetails(id),
        (server) => server.reply(
          200,
          MockTransactionDetails.forId(id),
        ),
      );
    }
  }

  static void _registerCards(DioAdapter adapter) {
    final MockCardsStore store = MockCardsStore.instance;

    adapter.onGet(
      ApiEndpoints.cards,
      (server) => server.reply(
        200,
        <String, Object>{'cards': store.summaries},
      ),
    );

    adapter.onPost(
      ApiEndpoints.cards,
      (server) => server.replyCallback(
        201,
        (RequestOptions options) {
          final Map<String, dynamic> body =
              options.data! as Map<String, dynamic>;
          return store.createFromBody(body);
        },
        delay: const Duration(milliseconds: 400),
      ),
    );

    adapter.onDelete(
      RegExp('^${RegExp.escape(ApiEndpoints.cards)}/[a-zA-Z0-9_-]+\$'),
      (server) => server.replyCallback(
        204,
        (RequestOptions options) {
          final String id = options.path.split('/').last;
          store.deleteById(id);
          return <String, String>{};
        },
        delay: const Duration(milliseconds: 300),
      ),
    );

    adapter.onGet(
      RegExp('^${RegExp.escape(ApiEndpoints.cards)}/[a-zA-Z0-9_-]+\$'),
      (server) => server.replyCallback(
        200,
        (RequestOptions options) {
          final String id = options.path.split('/').last;
          return store.detailsFor(id) ?? MockCardDetails.forId(id);
        },
      ),
    );
  }

  static void _registerAccounts(DioAdapter adapter) {
    final MockAccountsStore store = MockAccountsStore.instance;

    adapter.onGet(
      ApiEndpoints.accounts,
      (server) => server.reply(
        200,
        <String, Object>{'accounts': store.summaries},
      ),
    );

    adapter.onPost(
      ApiEndpoints.accounts,
      (server) => server.replyCallback(
        201,
        (RequestOptions options) {
          final Map<String, dynamic> body =
              options.data! as Map<String, dynamic>;
          return store.createFromBody(body);
        },
        delay: const Duration(milliseconds: 400),
      ),
    );

    adapter.onDelete(
      RegExp('^${RegExp.escape(ApiEndpoints.accounts)}/[a-zA-Z0-9_-]+\$'),
      (server) => server.replyCallback(
        204,
        (RequestOptions options) {
          final String id = options.path.split('/').last;
          store.deleteById(id);
          return <String, String>{};
        },
        delay: const Duration(milliseconds: 300),
      ),
    );

    adapter.onGet(
      RegExp('^${RegExp.escape(ApiEndpoints.accounts)}/[a-zA-Z0-9_-]+\$'),
      (server) => server.replyCallback(
        200,
        (RequestOptions options) {
          final String id = options.path.split('/').last;
          return store.detailsFor(id) ?? MockAccountDetails.forId(id);
        },
      ),
    );
  }

  static void _registerFeatureStubs(DioAdapter adapter) {
    _registerTransactions(adapter);
    _registerCards(adapter);
    _registerAccounts(adapter);
    adapter.onGet(
      ApiEndpoints.dashboard,
      (server) => server.reply(
        200,
        <String, Object>{
          'balance': 12450.75,
          'currency': 'USD',
          'recentTransactions': <Map<String, Object>>[
            <String, Object>{
              'id': 'tx-1',
              'title': 'Coffee Shop',
              'amount': -4.50,
              'date': '2026-05-24',
            },
          ],
        },
      ),
    );

    adapter.onGet(
      ApiEndpoints.profile,
      (server) => server.reply(
        200,
        <String, Object>{
          'id': 'user-1',
          'fullName': 'Alex Morgan',
          'email': 'alex@mock.fintech',
          'recentTransactions': MockTransactionDetails.transactionsList,
        },
      ),
    );
  }
}
