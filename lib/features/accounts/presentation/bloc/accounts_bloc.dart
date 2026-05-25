import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/usecases/get_accounts_usecase.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_event.dart';
import 'package:fintech/features/accounts/presentation/bloc/accounts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc(this._getAccountsUseCase) : super(const AccountsInitial()) {
    on<AccountsLoadRequested>(_onLoad, transformer: droppable());
    on<AccountsRefreshRequested>(_onLoad, transformer: droppable());
  }

  final GetAccountsUseCase _getAccountsUseCase;

  Future<void> _onLoad(AccountsEvent event, Emitter<AccountsState> emit) async {
    emit(const AccountsLoading());

    final Result<List<Account>> result = await _getAccountsUseCase();

    switch (result) {
      case Success<List<Account>>(:final value):
        emit(AccountsLoaded(value));
      case Error<List<Account>>(:final failure):
        emit(AccountsError(failure));
    }
  }
}
