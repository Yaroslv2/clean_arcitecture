import 'package:flutter/material.dart';

class FullnameForm extends StatefulWidget {
  const FullnameForm({super.key});

  @override
  State<FullnameForm> createState() => _FullnameFormState();
}

class _FullnameFormState extends State<FullnameForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "Как вас зовут?",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Фамилия"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Имя"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Отчество"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
