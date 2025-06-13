import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    setState(() => isPasswordHidden = !isPasswordHidden);
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: isPasswordHidden ? Colors.grey : Colors.blue,
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
                print('clicked');
                setState(() {});
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
  }
}
