import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_event.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  bool isValidEmail(String emailTyped) {
    // regular expression: example@email.vn (not begin with .): test@vais.vn
    // final emailRegExp =
    //     RegExp(r"^[a-zA-Z0-9][a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final emailRegExp = RegExp(r"^[a-zA-Z0-9]+");
    return emailRegExp.hasMatch(emailTyped);
  }

  bool isValidPassword(String passwordTyped) {
    // regular expression: 8 digit +:Test1234
    final passwordRegExp = RegExp(r'\S{7,}');
    return passwordRegExp.hasMatch(passwordTyped);
  }

  // bool isValidInput() {
  //   return isValidEmail(_emailController.text) &&
  //       isValidPassword(_passwordController.text);
  // }

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) => current is AuthenticationFail,
          listener: (context, state) {
            if (state is AuthenticationFail) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              context.read<AuthenticationBloc>().add(LoginRetry());
            }
          },
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("Welcome back!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        )),
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.1,
                                left: size.width * 0.05,
                                right: size.width * 0.05,
                              ),
                              child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                      RegExp(r'\s'),
                                    )
                                  ],
                                  onChanged: (value) {
                                    //isValid.value = isValidInput();
                                    isValid.value =
                                        _formKey.currentState!.validate();
                                  },
                                  onTapOutside: (event) =>
                                      FocusManager().primaryFocus?.unfocus(),
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      // label: Text("Email"),
                                      icon: const Icon(Icons.email_outlined),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter your email",
                                      suffixIcon: IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () => {
                                                _emailController.clear(),
                                                isValid.value = false,
                                              })),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (!isValidEmail(value!)) {
                                      return "Enter valid name";
                                    }
                                    if (value.isEmpty) {
                                      return "Email can't left empty";
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.05,
                                left: size.width * 0.05,
                                right: size.width * 0.05,
                              ),
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r'\s'),
                                  )
                                ],
                                onChanged: (value) {
                                  isValid.value =
                                      _formKey.currentState!.validate();
                                  // isValid.value = isValidInput();
                                },
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  // label: const Text("Password"),
                                  icon: const Icon(Icons.lock_outline),
                                  border: const UnderlineInputBorder(),
                                  hintText: "Enter your password",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                validator: (value) {
                                  if (!isValidPassword(value!)) {
                                    return "Enter valid password: at least 7 digit";
                                  }
                                  if (value.isEmpty) {
                                    return "Password can't left empty";
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.4,
                                  bottom: size.height * 0.02),
                              child: const TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Forgot password ?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
                                  )),
                            ),
                            ValueListenableBuilder(
                              valueListenable: isValid,
                              builder: (context, isValid, child) {
                                return ElevatedButton(
                                  onPressed: !isValid
                                      ? null
                                      : () => {
                                            // FocusManager.instance.primaryFocus
                                            //     ?.unfocus(),
                                            context
                                                .read<AuthenticationBloc>()
                                                .add(LoginRequest(
                                                    email: _emailController.text
                                                        .trim(),
                                                    password:
                                                        _passwordController.text
                                                            .trim()))
                                          },
                                  style: ButtonStyle(
                                    backgroundColor: isValid
                                        ? const MaterialStatePropertyAll<Color>(
                                            Colors.lightBlue)
                                        : MaterialStatePropertyAll<Color>(
                                            Colors.grey.shade300),
                                    padding: MaterialStatePropertyAll<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          horizontal: size.width * 0.39,
                                          vertical: size.height * 0.02),
                                    ),
                                  ),
                                  child: const Text(
                                    "Log in",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
