import 'package:fintech/core/domain/failure.dart';

/// Functional result type for use cases and repositories.
///
/// Prefer exhaustive `switch` on [Result] in UI and BLoCs.
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;

  bool get isError => this is Error<T>;

  T? get valueOrNull => switch (this) {
        Success<T>(:final value) => value,
        Error<T>() => null,
      };

  Failure? get failureOrNull => switch (this) {
        Success<T>() => null,
        Error<T>(:final failure) => failure,
      };

  Result<R> map<R>(R Function(T value) transform) => switch (this) {
        Success<T>(:final value) => Success<R>(transform(value)),
        Error<T>(:final failure) => Error<R>(failure),
      };

  Future<Result<R>> mapAsync<R>(Future<R> Function(T value) transform) async =>
      switch (this) {
        Success<T>(:final value) => Success<R>(await transform(value)),
        Error<T>(:final failure) => Error<R>(failure),
      };
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

final class Error<T> extends Result<T> {
  const Error(this.failure);

  final Failure failure;
}
