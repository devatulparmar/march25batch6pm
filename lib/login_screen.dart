import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:march25batch6pm/login/login_bloc.dart';
import 'package:march25batch6pm/login/login_event.dart';
import 'package:march25batch6pm/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (BuildContext context, LoginStates state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        }
      },
      builder: (context, LoginStates snapshot) {
        switch (snapshot.runtimeType) {
          case LoginLoadingState:
            return Container(
              color: Colors.black12,
              child: const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          case LoginErrorState:
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text("Something went wrong!"),
              ),
            );
          case LoginSuccessState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("Login in"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          final regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          bool isValidEmail = regex.hasMatch(value!);
                          if (value == '') {
                            return "Please enter an email";
                          } else if (isValidEmail == false) {
                            return "Please enter valid email";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: isPasswordHidden,
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Please enter a password";
                          } else if (RegExp(r'^(?=.*?[A-Z])').hasMatch(value) ==
                              false) {
                            return "Should contain at least one upper case";
                          } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                            return "Should contain at least one lower case";
                          } else if (!RegExp(r'^(?=.*?[0-9])')
                              .hasMatch(value)) {
                            return "Should contain at least one digit";
                          } else if (!RegExp(r'^(?=.*?[!@#$&*~%])')
                              .hasMatch(value)) {
                            return "Should contain at least one Special character";
                          } else if (!RegExp(r'^.{6,}').hasMatch(value)) {
                            return "Must be at least 6 characters in length.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                  () => isPasswordHidden = !isPasswordHidden);
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color:
                                  isPasswordHidden ? Colors.grey : Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonClickEvent(
                                userController.text,
                                passwordController.text,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text("UserName: ${userController.text}"),
                      Text("Password: ${passwordController.text}"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          userController.clear();
                          passwordController.clear();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Clear",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          default:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("Login in"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          final regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          bool isValidEmail = regex.hasMatch(value!);
                          if (value == '') {
                            return "Please enter an email";
                          } else if (isValidEmail == false) {
                            return "Please enter valid email";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: isPasswordHidden,
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Please enter a password";
                          } else if (RegExp(r'^(?=.*?[A-Z])').hasMatch(value) ==
                              false) {
                            return "Should contain at least one upper case";
                          } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                            return "Should contain at least one lower case";
                          } else if (!RegExp(r'^(?=.*?[0-9])')
                              .hasMatch(value)) {
                            return "Should contain at least one digit";
                          } else if (!RegExp(r'^(?=.*?[!@#$&*~%])')
                              .hasMatch(value)) {
                            return "Should contain at least one Special character";
                          } else if (!RegExp(r'^.{6,}').hasMatch(value)) {
                            return "Must be at least 6 characters in length.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                  () => isPasswordHidden = !isPasswordHidden);
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color:
                                  isPasswordHidden ? Colors.grey : Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonClickEvent(
                                userController.text,
                                passwordController.text,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text("UserName: ${userController.text}"),
                      Text("Password: ${passwordController.text}"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          userController.clear();
                          passwordController.clear();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Clear",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
