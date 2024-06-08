import 'package:clean_architecture/presentation/pages/sign_in/widget/submit_button.dart';
import 'package:clean_architecture/presentation/pages/sign_up/view/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              label: Text("Логин"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(),
              ),
            ),
            validator: (value) {
              if (value == null || value == "") {
                return "Необходимо заполнить это поле";
              }
            },
          ),
          SizedBox(height: 7),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              label: Text("Пароль"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(),
              ),
            ),
            validator: (value) {
              if (value == null || value == "") {
                return "Необходимо заполнить это поле";
              }
              if (value.length < 8) {
                return "Пароль не может быть менее 8 символов";
              }
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text("Забыли пароль?"),
          ),
          const SizedBox(height: 5),
          SubmitButton(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Нет аккаута?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SignUpPage.route(),
                    );
                  },
                  child: Text("Зарегистрируйтесь!")),
            ],
          ),
        ],
      ),
    );
  }
}
