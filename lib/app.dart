import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_event.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';
import 'package:school_app/authentication/view/login_screen.dart';
import 'package:school_app/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: const BlocNavigate(),
      ),
    );
  }
}

class BlocNavigate extends StatefulWidget {
  const BlocNavigate({super.key});

  @override
  State<BlocNavigate> createState() => _BlocNavigateState();
}

class _BlocNavigateState extends State<BlocNavigate> {
  @override
  void initState() {
    context.read<AuthenticationBloc>()
      ..add(LoadingUser())
      ..add(CheckAutoLogin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        print(state);
        if (state is AuthenticationSuccess) {
          return const HomeScreen();
        } else if (state is AuthenticationLoading) {
          // or blocListener
          return const CircularProgressIndicator();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
