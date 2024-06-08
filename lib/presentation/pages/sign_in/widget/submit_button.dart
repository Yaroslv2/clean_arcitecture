import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const SubmitButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  Widget buttonContent(AuthStatus state) {
    if (state == AuthStatus.loading) {
      return CircularProgressIndicator();
    }

    return Text("Sign in");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.state != current.state,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state.state == AuthStatus.loading) {
                return;
              }
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthBloc>(context).add(AuthEvent.signIn(
                  email: emailController.text,
                  password: passwordController.text,
                ));
              }
            },
            child: buttonContent(state.state),
          ),
        );
      },
    );
  }
}
