import 'package:clean_architecture/domain/bloc/cources_page/courses_page_bloc.dart';
import 'package:clean_architecture/presentation/pages/courses/view/courses_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesPageBloc()
        ..add(
          CoursesPageEvent.loadingCources(),
        ),
      child: CoursesForm(),
    );
  }
}
