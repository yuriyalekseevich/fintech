import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/core/network/mock/mock_account_details.dart';
import 'package:fintech/core/network/mock/mock_card_details.dart';
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
    adapter.onGet(
      ApiEndpoints.cards,
      (server) => server.reply(
        200,
        <String, Object>{'cards': MockCardDetails.cardsList},
      ),
    );

    for (final Map<String, Object> summary in MockCardDetails.cardsList) {
      final String id = summary['id']! as String;
      adapter.onGet(
        ApiEndpoints.cardDetails(id),
        (server) => server.reply(200, MockCardDetails.forId(id)),
      );
    }
  }

  static void _registerAccounts(DioAdapter adapter) {
    adapter.onGet(
      ApiEndpoints.accounts,
      (server) => server.reply(
        200,
        <String, Object>{'accounts': MockAccountDetails.accountsList},
      ),
    );

    for (final Map<String, Object> summary in MockAccountDetails.accountsList) {
      final String id = summary['id']! as String;
      adapter.onGet(
        ApiEndpoints.accountDetails(id),
        (server) => server.reply(200, MockAccountDetails.forId(id)),
      );
    }
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
