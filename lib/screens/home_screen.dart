import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    content: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Do you really want to log out?"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () => {
                                        Navigator.pop(ctx),
                                        context
                                            .read<AuthenticationBloc>()
                                            .add(LogoutRequest()),
                                      },
                                  child: const Text("Log out")),
                              TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child: const Text("Cancel"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            child: const Text("Log out")),
      ),
    );
  }
}
