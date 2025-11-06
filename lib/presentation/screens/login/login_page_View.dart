import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/presentation/customs/custom_elevated_button.dart';
import 'package:flutter_application_2/presentation/customs/custom_textField.dart';
import 'package:flutter_application_2/presentation/screens/login/login_page_ViewModel.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageView();
}

class _LoginPageView extends State<LoginPageView> {
  final _formKey = GlobalKey<FormState>();
  late final LoginPageViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = LoginPageViewModel(Appcoordinator());
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _loginCard());
  }

  Widget _loginCard() {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 80, 83, 82), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(child: _loginForm()),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: "e_mail",
            onChanged: _viewModel.setEmail,
            validator: _viewModel.validateEmail,
          ),
          CustomTextField(
            labelText: "password",
            onChanged: _viewModel.setPassword,
            validator: _viewModel.validatePassword,
          ),
          CustomElevatedButton(
            text: "Login",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _viewModel.login();
              }
            },
          ),
        ],
      ),
    );
  }
}
