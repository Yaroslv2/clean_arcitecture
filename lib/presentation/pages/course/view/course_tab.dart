import 'package:clean_architecture/domain/bloc/course_page/course_page_bloc.dart';
import 'package:clean_architecture/presentation/pages/nested/view/nested_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CourseTab extends StatelessWidget {
  const CourseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursePageBloc, CoursePageState>(
      buildWhen: (previous, current) =>
          previous.courseTabStatus != current.courseTabStatus,
      builder: (context, state) {
        if (state.courseTabStatus == CoursePageStatus.success) {
          return Markdown(
            onTapLink: (text, href, title) {
              Navigator.of(context).push(NestedPage.route(link: href ?? ""));
            },
            data: state.markdown,
          );
        }
        if (state.courseTabStatus == CoursePageStatus.failure) {
          return Center(
            child: Text(state.courseTabErrorMessage ?? "Неизвестная ошибка"),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
