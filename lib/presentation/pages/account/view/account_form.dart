import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:clean_architecture/presentation/pages/account/widget/profile_button.dart';
import 'package:clean_architecture/presentation/pages/account/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPageForm extends StatelessWidget {
  const AccountPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        UserCard(),
        SizedBox(
          height: 20,
        ),
        ProfileButton(
          icon: Icons.settings,
          onPressed: () {},
          label: "Настройки",
          color: Colors.black,
        ),
        Divider(),
        ProfileButton(
          icon: Icons.sensor_door_outlined,
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(AuthEvent.logout());
          },
          label: "Выйти",
          color: Colors.red,
        ),
      ],
    );
  }
}
