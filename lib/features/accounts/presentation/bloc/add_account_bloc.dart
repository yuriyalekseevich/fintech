import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/usecases/create_account_usecase.dart';
import 'package:fintech/features/accounts/presentation/bloc/add_account_event.dart';
import 'package:fintech/features/accounts/presentation/bloc/add_account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAccountBloc extends Bloc<AddAccountEvent, AddAccountState> {
  AddAccountBloc(this._createAccountUseCase) : super(const AddAccountInitial()) {
    on<AddAccountSubmitted>(_onSubmitted, transformer: droppable());
  }

  final CreateAccountUseCase _createAccountUseCase;

  Map<String, String> fieldErrors = const <String, String>{};

  Future<void> _onSubmitted(
    AddAccountSubmitted event,
    Emitter<AddAccountState> emit,
  ) async {
    emit(const AddAccountSubmitting());
    fieldErrors = const <String, String>{};

    final Result<Account> result = await _createAccountUseCase(
      name: event.name,
      currency: event.currency,
      accountType: event.accountType,
      initialBalance: event.initialBalance,
    );

    switch (result) {
      case Success<Account>():
        emit(const AddAccountSuccess());
      case Error<Account>(:final failure):
        if (failure is ValidationFailure) {
          fieldErrors = failure.fieldErrors;
        }
        emit(AddAccountFailure(failure));
    }
  }
}
