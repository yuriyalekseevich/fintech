import 'package:fintech/core/domain/failure.dart';

sealed class AddAccountState {
  const AddAccountState();
}

final class AddAccountInitial extends AddAccountState {
  const AddAccountInitial();
}

final class AddAccountSubmitting extends AddAccountState {
  const AddAccountSubmitting();
}

final class AddAccountSuccess extends AddAccountState {
  const AddAccountSuccess();
}

final class AddAccountFailure extends AddAccountState {
  const AddAccountFailure(this.failure);

  final Failure failure;
}
