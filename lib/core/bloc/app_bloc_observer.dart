import 'dart:developer' as developer;

import 'package:fintech/core/bloc/bloc_log_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Debug-only observer that logs every bloc event, transition, and error.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  static const String _tag = 'BLOC';
  static const int _dividerWidth = 52;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    _log(
      kind: 'EVENT',
      bloc: bloc,
      lines: <String>['event: ${BlocLogFormatter.describe(event)}'],
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _log(
      kind: 'TRANSITION',
      bloc: bloc,
      lines: <String>[
        'event        : ${BlocLogFormatter.describe(transition.event)}',
        'currentState : ${BlocLogFormatter.describe(transition.currentState)}',
        'nextState    : ${BlocLogFormatter.describe(transition.nextState)}',
      ],
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Bloc<dynamic, dynamic>) {
      return;
    }

    _log(
      kind: 'CHANGE',
      bloc: bloc,
      lines: <String>[
        'currentState : ${BlocLogFormatter.describe(change.currentState)}',
        'nextState    : ${BlocLogFormatter.describe(change.nextState)}',
      ],
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (!kDebugMode) {
      return;
    }

    developer.log(
      _frame(
        kind: 'ERROR',
        bloc: bloc,
        lines: <String>[
          'error: $error',
          'stack: $stackTrace',
        ],
      ),
      name: _tag,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    _log(kind: 'CLOSE', bloc: bloc, lines: const <String>[]);
  }

  void _log({
    required String kind,
    required BlocBase<dynamic> bloc,
    required List<String> lines,
  }) {
    if (!kDebugMode) {
      return;
    }

    developer.log(
      _frame(kind: kind, bloc: bloc, lines: lines),
      name: _tag,
    );
  }

  String _frame({
    required String kind,
    required BlocBase<dynamic> bloc,
    required List<String> lines,
  }) {
    final String blocName = bloc.runtimeType.toString();
    final StringBuffer buffer = StringBuffer()
      ..writeln('┌─ $_tag $kind ${_repeat('─', _titleDashCount(kind))}')
      ..writeln('│ bloc: $blocName');

    for (final String line in lines) {
      for (final String wrapped in _wrap(line)) {
        buffer.writeln('│ $wrapped');
      }
    }

    buffer.write('└${_repeat('─', _dividerWidth)}');
    return buffer.toString();
  }

  static int _titleDashCount(String kind) {
    const int total = _dividerWidth - _tag.length - 2;
    return (total - kind.length).clamp(4, total);
  }

  static Iterable<String> _wrap(String text) sync* {
    const int width = 72;
    for (final String part in text.split('\n')) {
      if (part.length <= width) {
        yield part;
        continue;
      }
      var start = 0;
      while (start < part.length) {
        final int end = (start + width).clamp(0, part.length);
        yield part.substring(start, end);
        start = end;
      }
    }
  }

  static String _repeat(String char, int count) => List.filled(count, char).join();
}
