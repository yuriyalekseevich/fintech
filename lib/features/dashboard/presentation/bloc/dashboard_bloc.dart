import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/dashboard/domain/entities/dashboard.dart';
import 'package:fintech/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:fintech/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:fintech/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._getDashboardUseCase) : super(const DashboardInitial()) {
    on<DashboardLoadRequested>(
      _onLoad,
      transformer: droppable(),
    );
    on<DashboardRefreshRequested>(
      _onLoad,
      transformer: droppable(),
    );
  }

  final GetDashboardUseCase _getDashboardUseCase;

  Future<void> _onLoad(
    DashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());

    final Result<Dashboard> result = await _getDashboardUseCase();

    switch (result) {
      case Success<Dashboard>(:final value):
        emit(DashboardLoaded(value));
      case Error<Dashboard>(:final failure):
        emit(DashboardError(failure));
    }
  }
}
