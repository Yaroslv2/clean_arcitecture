import 'package:clean_architecture/domain/bloc/sign_up_page/sign_up_page_bloc.dart';
import 'package:clean_architecture/presentation/pages/sign_up/view/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SignUpPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SignUpPageBloc()..add(SignUpPageEvent.getEnvs()),
        child: SignUpPageForm(),
      ),
    );
  }
}
