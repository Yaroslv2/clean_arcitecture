import 'package:flutter/material.dart';

class AccountStep extends StatefulWidget {
  const AccountStep({super.key});

  @override
  State<AccountStep> createState() => _AccountStepState();
}

class _AccountStepState extends State<AccountStep> {
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
                    "Логин и пароль",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Логин"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Пароль"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}