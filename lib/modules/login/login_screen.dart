import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool signupMode = false;
  String expectedEmail = 'c@c.com', expectedPassword = '1234';
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController();

  void login() {
    bool loginSuccess = false;
    if (signupMode) {
      loginSuccess = checkSignup();
    } else {
      loginSuccess = checkLogin();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${signupMode ? 'Sign up' : 'Login'} ${loginSuccess ? 'successful' : 'failed'}',
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 50,
      ),
    );
    if (loginSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  bool checkLogin() {
    return emailController.text == expectedEmail &&
        passwordController.text == expectedPassword;
  }

  bool checkSignup() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    setState(() {
      print('Cleared');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              signupMode
                  ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            labelText: 'Full Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  )
                  : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
              ElevatedButton(
                onPressed: login,
                child: Text(signupMode ? 'SIGN UP' : 'LOGIN'),
              ),
              SizedBox(height: 16),
              Text('or'),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  clearControllers();
                  setState(() {
                    signupMode = !signupMode;
                  });
                },
                child: Text(signupMode ? 'LOGIN' : 'SIGN UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
