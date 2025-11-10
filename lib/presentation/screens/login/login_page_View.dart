import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/presentation/screens/login/login_page_ViewModel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageView();
}

class _LoginPageView extends State<LoginPageView> {
  final _formKey = GlobalKey<FormBuilderState>();
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

  String? _emailErrorText;
  String? _passwordErrorText;
  Widget _loginForm() {
    return FormBuilder(
      key: _formKey,

      child: Column(
        children: [
          FormBuilderTextField(
            name: 'Email',

            decoration: InputDecoration(
              labelText: 'Email',
              errorText: _emailErrorText,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          FormBuilderTextField(
            name: 'Password',
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: _passwordErrorText,
            ),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(6),
            ]),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                final email =
                    _formKey.currentState?.fields['Email']?.value ?? '';
                final password =
                    _formKey.currentState?.fields['Password']?.value ?? '';
                _viewModel.setEmail(email);
                _viewModel.setPassword(password);
                await _viewModel.login();
                if (_viewModel.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_viewModel.errorMessage!)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Successful')),
                  );
                }
              } else {
                print(_emailErrorText);
                print(_passwordErrorText);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Validation Failed')),
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
