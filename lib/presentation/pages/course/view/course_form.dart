import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/presentation/pages/course/view/course_tab.dart';
import 'package:flutter/material.dart';

class CourseForm extends StatefulWidget {
  final Course course;
  const CourseForm({super.key, required this.course});

  @override
  State<CourseForm> createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  late final ScrollController _scrollController;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_isSliverAppBarExpanded != _isExpanded) {
          setState(() {
            _isExpanded = _isSliverAppBarExpanded;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset < (80 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              title: _isExpanded
                  ? null
                  : Text(
                      widget.course.name,
                      style: TextStyle(color: Colors.black),
                    ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Семестр ${widget.course.term}",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          widget.course.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                            "Преподаватель: ${widget.course.teacher.fullname}"),
                        Text("Кафедра ${widget.course.department}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  tabs: [
                    Tab(text: "Курс"),
                    Tab(
                      text: "Оценки",
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            CourseTab(),
            Center(
              child: Text("Coming soon..."),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
