part of 'nested_page_bloc.dart';

class NestedPageState {
  final Nested? nested;
  final NestedPageStatus status;
  final String? errorMessage;

  const NestedPageState({
    this.nested,
    required this.status,
    this.errorMessage,
  });

  factory NestedPageState.initial() =>
      NestedPageState(status: NestedPageStatus.nun);

  NestedPageState copyWith({
    Nested? nested,
    NestedPageStatus? status,
    String? errorMessage,
  }) =>
      NestedPageState(
        nested: nested ?? this.nested,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

enum NestedPageStatus { nun, loading, success, failure }
