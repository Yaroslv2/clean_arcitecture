import 'package:clean_architecture/domain/model/nested.dart';
import 'package:flutter/material.dart';

class LabPage extends StatelessWidget {
  final Lab lab;
  const LabPage({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Лабораторная работа"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            lab.topic,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("Открывается: " + lab.opens.toString()),
          Text("Закрывается: " + lab.closes.toString()),
          Text("Место проведения: " + lab.locationId),
          Text("Количество попыток: " + lab.attemts.toString()),
        ],
      ),
    );
  }
}
