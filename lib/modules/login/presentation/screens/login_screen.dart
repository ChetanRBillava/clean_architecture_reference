import 'package:clean_architecture_reference/core/constants/app_strings.dart';
import 'package:clean_architecture_reference/modules/login/presentation/bloc/login_bloc.dart';
import 'package:clean_architecture_reference/modules/login/presentation/bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/home_screen.dart';
import '../bloc/login_state.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController();

  void login(bool signupMode) {
    if (signupMode) {
      context.read<LoginBloc>().add(
        FormValidateEvent(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    } else {
      context.read<LoginBloc>().add(
        FormValidateEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, loginListenerState) {
        if (loginListenerState.showToast) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loginListenerState.toastMessage),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              elevation: 50,
            ),
          );
        }
        if (loginListenerState.loginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      builder: (context, loginBuilderState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(AppStrings.loginScreenTitle),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  loginBuilderState.signupMode
                      ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: nameController,
                              hintText: AppStrings.nameControllerHintText,
                              labelText: AppStrings.nameControllerLabelText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: emailController,
                              hintText: AppStrings.emailControllerHintText,
                              labelText: AppStrings.emailControllerLabelText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: passwordController,
                              hintText: AppStrings.passwordControllerHintText,
                              labelText: AppStrings.passwordControllerLabelText,
                            ),
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: emailController,
                              hintText: AppStrings.emailControllerHintText,
                              labelText: AppStrings.emailControllerLabelText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: passwordController,
                              hintText: AppStrings.passwordControllerHintText,
                              labelText: AppStrings.passwordControllerLabelText,
                            ),
                          ),
                        ],
                      ),
                  ElevatedButton(
                    onPressed: () => login(loginBuilderState.signupMode),
                    child: Text(
                      loginBuilderState.signupMode
                          ? AppStrings.signupText
                          : AppStrings.loginText,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('or'),
                  SizedBox(height: 16),
                  ButtonWidget(
                    buttonText:
                        loginBuilderState.signupMode
                            ? AppStrings.loginText
                            : AppStrings.signupText,
                    onTap: () {
                      clearControllers();
                      context.read<LoginBloc>().add(ModeToggleEvent());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
