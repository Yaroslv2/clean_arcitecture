import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:clean_architecture/presentation/pages/account/view/account_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: AccountPageForm(),
    );
  }
}
