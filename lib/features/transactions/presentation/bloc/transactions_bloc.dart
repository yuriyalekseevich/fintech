import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:fintech/features/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:fintech/features/transactions/presentation/bloc/transactions_event.dart';
import 'package:fintech/features/transactions/presentation/bloc/transactions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc(this._getTransactionsUseCase)
      : super(const TransactionsInitial()) {
    on<TransactionsLoadRequested>(_onLoad, transformer: droppable());
    on<TransactionsRefreshRequested>(_onLoad, transformer: droppable());
  }

  final GetTransactionsUseCase _getTransactionsUseCase;

  Future<void> _onLoad(
    TransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(const TransactionsLoading());

    final Result<List<TransactionSummary>> result =
        await _getTransactionsUseCase();

    switch (result) {
      case Success<List<TransactionSummary>>(:final value):
        emit(TransactionsLoaded(value));
      case Error<List<TransactionSummary>>(:final failure):
        emit(TransactionsError(failure));
    }
  }
}
