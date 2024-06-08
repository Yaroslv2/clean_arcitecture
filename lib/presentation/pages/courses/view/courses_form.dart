import 'package:clean_architecture/domain/bloc/cources_page/courses_page_bloc.dart';
import 'package:clean_architecture/presentation/pages/courses/widgets/courses_list_view.dart';
import 'package:clean_architecture/presentation/pages/courses/widgets/falure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesForm extends StatelessWidget {
  const CoursesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Курсы"),
      ),
      body: BlocBuilder<CoursesPageBloc, CoursesPageState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (context, state) {
          switch (state.state) {
            case CoursesPageStatus.success:
              return CoursesListView(courses: state.courses);
            case CoursesPageStatus.failure:
              return Center(
                child: FailureWidget(
                  errorMessage: state.errorMessage ?? "Непредвиденная ошибка",
                ),
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

