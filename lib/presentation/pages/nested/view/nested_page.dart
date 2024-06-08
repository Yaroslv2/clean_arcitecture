import 'package:clean_architecture/domain/bloc/nested_page/nested_page_bloc.dart';
import 'package:clean_architecture/domain/model/nested.dart';
import 'package:clean_architecture/presentation/pages/nested/view/info_page.dart';
import 'package:clean_architecture/presentation/pages/nested/view/lab_page.dart';
import 'package:clean_architecture/presentation/pages/nested/view/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NestedPage extends StatelessWidget {
  final String link;
  const NestedPage({super.key, required this.link});

  static Route<dynamic> route({required String link}) => MaterialPageRoute(
        builder: (context) => NestedPage(link: link),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NestedPageBloc()..add(NestedPageEvent.loadingNested(link: link)),
      child: BlocBuilder<NestedPageBloc, NestedPageState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status == NestedPageStatus.success) {
            switch (state.nested!.type) {
              case NestedType.info:
                return InfoPage(
                  info: state.nested! as Info,
                );
              case NestedType.lab:
                return LabPage(
                  lab: state.nested! as Lab,
                );
              case NestedType.test:
                return TestPage(test: state.nested! as Test);
            }
          }

          if (state.status == NestedPageStatus.failure) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(state.errorMessage ?? "Неизвестная ошибка"),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
