import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/presentation/pages/course/view/course_page.dart';
import 'package:flutter/material.dart';

class CoursesListView extends StatelessWidget {
  final List<Course> courses;
  const CoursesListView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: courses.length,
      itemBuilder: (context, index) => _CourseListViewItem(
        course: courses.elementAt(index),
      ),
    );
  }
}

class _CourseListViewItem extends StatelessWidget {
  final Course course;
  const _CourseListViewItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(context, CoursePage.route(course: course));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Семестр ${course.term}",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      course.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Кафедра ${course.department}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.star_border),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
