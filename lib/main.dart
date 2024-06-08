import 'package:clean_architecture/data/repository/token_repository.dart';
import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:clean_architecture/domain/bloc/user/user_bloc.dart';
import 'package:clean_architecture/internal/application.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenRepository.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: RepositoryModule.authRepository,
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(
            userRepository: RepositoryModule.userRepository,
            authBloc: RepositoryProvider.of<AuthBloc>(context),
          ),
        ),
      ],
      child: Application(),
    ),
  );
}
