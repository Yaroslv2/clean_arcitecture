import 'package:clean_architecture/data/api/utils/middleware.dart';
import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:clean_architecture/domain/bloc/user/user_bloc.dart';
import 'package:clean_architecture/presentation/design/theme.dart';
import 'package:clean_architecture/presentation/pages/sign_in/view/sign_in_page.dart';
import 'package:clean_architecture/presentation/widgets/bottom_bar.dart';
import 'package:clean_architecture/presentation/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        Middleware.addAuthBloc(authBloc: context.read<AuthBloc>());
        BlocProvider.of<UserBloc>(context).add(UserEvent.getUserInfo());
        return MaterialApp(
          theme: theme,
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: _snackbarKey,
          onGenerateRoute: (_) => SplashScreen.route(),
          builder: (context, _) {
            return BlocListener<UserBloc, UserState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.isError) {
                  _snackbarKey.currentState!.showSnackBar(SnackBar(
                    content: Text(state.errorMessage ?? "Ошибка"),
                  ));
                }
                switch (state.status) {
                  case UserStatus.authorized:
                    _navigatorKey.currentState!.pushAndRemoveUntil(
                      BottomBar.route(),
                      (route) => false,
                    );
                    break;
                  case UserStatus.notAuthorized:
                    _navigatorKey.currentState!.pushAndRemoveUntil(
                      SignInPage.route(),
                      (route) => false,
                    );
                    break;
                  default:
                    break;
                }
              },
              child: _,
            );
          },
        );
      },
    );
  }
}
