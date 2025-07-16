import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:march25batch6pm/login/login_bloc.dart';
import 'package:march25batch6pm/login/login_event.dart';
import 'package:march25batch6pm/login/login_state.dart';
import 'package:march25batch6pm/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (BuildContext context, LoginStates state) {
        if (state is LoginLoadingState) {
          isLoading = true;
          setState(() {});
        } else if (state is LoginSuccessState) {
          isLoading = false;
          setState(() {});

          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        } else {}
      },
      builder: (context, snapshot) {
        return snapshot is LoginLoadingState
            ? Container(
                color: Colors.black12,
                child: const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blueAccent,
                  title: const Text("Login in"),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: userController,
                        textInputAction: TextInputAction.next,
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
                      TextField(
                        controller: passwordController,
                        obscureText: isPasswordHidden,
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
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginButtonClickEvent());
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
              );
      },
    );
  }
}
