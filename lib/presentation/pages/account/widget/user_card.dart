import 'package:clean_architecture/domain/bloc/user/user_bloc.dart';
import 'package:clean_architecture/domain/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {
  late final User user;
  UserCard({super.key});

  // Widget _userInfo(User user) {
  //   if (user.roleId == 1) {
  //     return Text("Это бля студент");
  //   }
  //   if (user.roleId == 2) {
  //     return Text("Это бля препод");
  //   }
  //   return Text("Это бля администратор");
  // }

  @override
  Widget build(BuildContext context) {
    user = BlocProvider.of<UserBloc>(context).state.user!;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: FittedBox(
                child: Icon(Icons.account_circle),
              ),
            ),
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.role,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      user.fullname,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("Организация: ${user.env}"),
                    Text("Кафедра: ${user.dep}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
