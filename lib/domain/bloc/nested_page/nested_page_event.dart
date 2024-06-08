part of 'nested_page_bloc.dart';

@immutable
sealed class NestedPageEvent {
  const NestedPageEvent();

  factory NestedPageEvent.loadingNested({required String link}) =>
      _LoadingNestedPage(link: link);
}

class _LoadingNestedPage extends NestedPageEvent {
  final String link;

  _LoadingNestedPage({required this.link});
}
