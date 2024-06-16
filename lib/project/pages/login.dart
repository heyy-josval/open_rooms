import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_rooms/project/methods/method_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool authError = false;
  bool buttonEnabled = false;

  void _setAuthError(bool bool) {
    setState(() {
      authError = bool;
    });
  }

  void _toggleButton() {
    setState(() {
      buttonEnabled = !buttonEnabled;
    });
  }

  void _handleLogin() async {
    _toggleButton();
    _setAuthError(false);
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      bool loginSuccess = await methodLogin(
        emailController.text,
        passwordController.text,
      );
      if (!loginSuccess) {
        _setAuthError(true);
      } else {
        _setAuthError(false);
      }
    } else {
      _setAuthError(true);
    }
    _toggleButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login to Open Rooms",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 45.0,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Correo Electronico",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Contraseña",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: Builder(
                builder: (context) {
                  if (authError) {
                    return const Text(
                      "Error de inicio de sesión",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: buttonEnabled ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  "Ingresar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
