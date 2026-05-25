import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/accounts/domain/entities/account_details.dart';
import 'package:fintech/features/accounts/domain/usecases/get_account_details_usecase.dart';
import 'package:fintech/features/accounts/presentation/bloc/account_details_event.dart';
import 'package:fintech/features/accounts/presentation/bloc/account_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountDetailsBloc extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  AccountDetailsBloc(
    this._getAccountDetailsUseCase,
    @factoryParam this._accountId,
  ) : super(const AccountDetailsInitial()) {
    on<AccountDetailsLoadRequested>(
      _onLoad,
      transformer: droppable(),
    );
  }

  final GetAccountDetailsUseCase _getAccountDetailsUseCase;
  final String _accountId;

  Future<void> _onLoad(
    AccountDetailsLoadRequested event,
    Emitter<AccountDetailsState> emit,
  ) async {
    emit(const AccountDetailsLoading());

    final Result<AccountDetails> result =
        await _getAccountDetailsUseCase(accountId: _accountId);

    switch (result) {
      case Success<AccountDetails>(:final value):
        emit(AccountDetailsLoaded(value));
      case Error<AccountDetails>(:final failure):
        emit(AccountDetailsError(failure));
    }
  }
}
