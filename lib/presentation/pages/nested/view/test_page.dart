import 'package:clean_architecture/domain/model/nested.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final Test test;
  const TestPage({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Тест"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            test.topic,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("Открывается: " + test.opens.toString()),
          Text("Закрывается: " + test.closes.toString()),
          Text("Количество задач: " + test.taskCount.toString()),
          Text("Место проведения: " + test.locationId),
          Text("Количество попыток: " + test.attemts.toString()),
          Text("Ограничение по времени: " + test.timeLimit),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Начать тест"),
        ),
      ),
    );
  }
}
