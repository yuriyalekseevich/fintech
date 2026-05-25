import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/transactions/domain/entities/transaction_details.dart';
import 'package:fintech/features/transactions/domain/usecases/get_transaction_details_usecase.dart';
import 'package:fintech/features/transactions/presentation/bloc/transaction_details_event.dart';
import 'package:fintech/features/transactions/presentation/bloc/transaction_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransactionDetailsBloc
    extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {
  TransactionDetailsBloc(
    this._getTransactionDetailsUseCase,
    @factoryParam this._transactionId,
  ) : super(const TransactionDetailsInitial()) {
    on<TransactionDetailsLoadRequested>(
      _onLoad,
      transformer: droppable(),
    );
  }

  final GetTransactionDetailsUseCase _getTransactionDetailsUseCase;
  final String _transactionId;

  Future<void> _onLoad(
    TransactionDetailsLoadRequested event,
    Emitter<TransactionDetailsState> emit,
  ) async {
    emit(const TransactionDetailsLoading());

    final Result<TransactionDetails> result =
        await _getTransactionDetailsUseCase(transactionId: _transactionId);

    switch (result) {
      case Success<TransactionDetails>(:final value):
        emit(TransactionDetailsLoaded(value));
      case Error<TransactionDetails>(:final failure):
        emit(TransactionDetailsError(failure));
    }
  }
}
