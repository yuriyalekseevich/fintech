import 'package:fintech/core/domain/failure.dart';

sealed class AddCardState {
  const AddCardState();
}

final class AddCardInitial extends AddCardState {
  const AddCardInitial();
}

final class AddCardSubmitting extends AddCardState {
  const AddCardSubmitting();
}

final class AddCardSuccess extends AddCardState {
  const AddCardSuccess();
}

final class AddCardFailure extends AddCardState {
  const AddCardFailure(this.failure);

  final Failure failure;
}
