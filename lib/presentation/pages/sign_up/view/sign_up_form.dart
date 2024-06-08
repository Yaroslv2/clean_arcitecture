import 'package:clean_architecture/presentation/pages/sign_up/view/accout_step.dart';
import 'package:clean_architecture/presentation/pages/sign_up/view/enviroment_step.dart';
import 'package:clean_architecture/presentation/pages/sign_up/view/fullname_form.dart';
import 'package:flutter/material.dart';

class SignUpPageForm extends StatefulWidget {
  const SignUpPageForm({super.key});

  @override
  State<SignUpPageForm> createState() => _SignUpPageFormState();
}

class _SignUpPageFormState extends State<SignUpPageForm>
    with TickerProviderStateMixin {
  final PageController _pageViewController = PageController();
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  int _currentPageIdx = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  _handlePageChanged(int index) {
    _tabController.index = index;
    setState(() {
      _currentPageIdx = index;
    });
  }

  _onUpdateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageChanged,
          children: [
            FullnameForm(),
            AccountStep(),
            EnviromentStep(),
          ],
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIdx,
          onUpdateCurrentPageIndex: _onUpdateCurrentPageIndex,
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  _getButtons(int index) {
    if (index == 0) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            onUpdateCurrentPageIndex(currentPageIndex + 1);
          },
          child: Text("далее"),
        ),
      );
    }
    if (index == 1) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ElevatedButton(
              onPressed: () {
                onUpdateCurrentPageIndex(currentPageIndex - 1);
              },
              child: Text("Назад"),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: ElevatedButton(
              onPressed: () {
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              },
              child: Text("Далее"),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: ElevatedButton(
            onPressed: () {
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            child: Text("Назад"),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Зарегистрироваться"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          _getButtons(currentPageIndex),
        ],
      ),
    );
  }
}
