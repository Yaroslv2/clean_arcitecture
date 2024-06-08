import 'package:clean_architecture/domain/bloc/course_page/course_page_bloc.dart';
import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/presentation/pages/course/view/course_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatelessWidget {
  final Course course;
  const CoursePage({super.key, required this.course});

  static Route<dynamic> route({required Course course}) => MaterialPageRoute(
        builder: (context) => CoursePage(
          course: course,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursePageBloc(
        course: course,
      )..add(
          CoursePageEvent.loadData(),
        ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: CourseForm(
          course: course,
        ),
      ),
    );
  }
}
