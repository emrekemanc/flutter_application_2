import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/presentation/customs/custom_form_builder_textField.dart';
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
  Future<void>? _loginFuture;
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginPageViewModel(Appcoordinator());
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _loginCard(MediaQuery.of(context).size));
  }

  late final StreamController<String> _streamController =
      StreamController<String>(
        onListen: () async {
          await Future.delayed(const Duration(seconds: 5));
          _streamController.sink.add('Hello Are You In There ?');
          await Future.delayed(const Duration(seconds: 5));
          _streamController.sink.add('Helloooo Please Respond !');
          await Future.delayed(const Duration(seconds: 5));
          _streamController.sink.add('Final Call !');
          await Future.delayed(const Duration(seconds: 5));
          _streamController.sink.add('Goodbye !');
          _streamController.close();
        },
      );
  Stream<String> get myStream => _streamController.stream;

  Widget _loginCard(Size size) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: myStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Text('');
                } else {
                  return Text('${snapshot.data}');
                }
              },
            ),

            Container(
              width: size.width * 0.80,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 80, 83, 82), Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(child: _loginForm()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _formBuilderTextField(
            FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email is required'),
              FormBuilderValidators.email(errorText: 'Invalid email address'),
            ]),
            'Email',
            _emailErrorText,
          ),
          _formBuilderTextField(
            FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Password is required'),
              FormBuilderValidators.minLength(
                6,
                errorText: 'Password must be at least 6 characters',
              ),
            ]),
            'Password',
            _passwordErrorText,
          ),
          const SizedBox(height: 20),
          _futureLoginButton(),
        ],
      ),
    );
  }

  Widget _formBuilderTextField(
    FormFieldValidator<String> validator,
    String label,
    String? errorText,
  ) {
    return Flexible(
      child: CustomFormBuilderTextfield(
        etiketMetni: label,
        dogrulama: validator,
        hataMetni: errorText,
        gizliMetin: label == 'Password',
      ),
    );
  }

  Widget _futureLoginButton() {
    return FutureBuilder<void>(
      future: _loginFuture,
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState == ConnectionState.waiting;

        return ElevatedButton(
          onPressed: isLoading ? null : _onLoginPressed,
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.blueAccent,
                  ),
                )
              : const Text('Login', style: TextStyle(fontSize: 16)),
        );
      },
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final email = _formKey.currentState?.fields['Email']?.value ?? '';
      final password = _formKey.currentState?.fields['Password']?.value ?? '';

      _viewModel.setEmail(email);
      _viewModel.setPassword(password);

      setState(() {
        _loginFuture = _viewModel.login();
        if (!mounted) return;
        _loginFuture!
            .then((_) {
              _showSnackBar(context, 'Login successful!');
            })
            .catchError((error) {
              _showSnackBar(
                context,
                _viewModel.errorMessage ?? 'Login failed.',
              );
            });
      });
    } else {
      _showSnackBar(context, 'Validation failed. Please check your input.');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
