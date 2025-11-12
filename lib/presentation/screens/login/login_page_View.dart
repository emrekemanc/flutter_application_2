import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
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
    _startStreamMessages();
  }

  @override
  void dispose() {
    _subscription?.cancel();

    _viewModel.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _loginCard(MediaQuery.of(context).size));
  }

  StreamSubscription<String>? _subscription;
  void listenToStream() {
    _subscription = myStream.listen(
      (data) {
        print('Received data: $data');
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        print('Stream closed');
      },
    );
  }

  late final StreamController<String> _streamController =
      StreamController<String>();
  Stream<String> get myStream => _streamController.stream;

  Future<void> _startStreamMessages() async {
    final messages = [
      'Hello Are You In There ?',
      'Helloooo Please Respond !',
      'Final Call !',
      'Goodbye !',
    ];

    for (var msg in messages) {
      await Future<void>.delayed(const Duration(seconds: 5));
      if (!mounted || _streamController.isClosed) return;
      _streamController.add(msg);
    }
    await _streamController.close();
  }

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
              FormBuilderValidators.required(
                errorText: 'login.email_required'.tr(),
              ),
              FormBuilderValidators.email(
                errorText: 'login.invalid_email'.tr(),
              ),
            ]),
            'login.email'.tr(),
            _emailErrorText,
            false,
          ),
          _formBuilderTextField(
            FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'login.password_required'.tr(),
              ),
              FormBuilderValidators.minLength(
                6,
                errorText: 'login.password_min_length'.tr(),
              ),
            ]),
            'login.password'.tr(),
            _passwordErrorText,
            true,
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
    bool isPassword,
  ) {
    return Flexible(
      child: CustomFormBuilderTextfield(
        title: label,
        validator: validator,
        errorText: errorText,
        scretText: isPassword,
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
              : Text(
                  'login.login_button'.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
        );
      },
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final email =
          _formKey.currentState?.fields['login.email'.tr()]?.value as String;
      final password =
          _formKey.currentState?.fields['login.password'.tr()]?.value as String;

      _viewModel
        ..setEmail(email)
        ..setPassword(password);

      setState(() {
        _loginFuture = _viewModel.login();
        _loginFuture!
            .then((_) {
              if (!mounted) return;
              _showSnackBar(context, 'login.login_success'.tr());
            })
            .catchError((error) {
              if (!mounted) return;
              _showSnackBar(
                context,
                _viewModel.errorMessage ?? 'login.login_failed'.tr(),
              );
            });
      });
    } else {
      _showSnackBar(context, 'login.validation_failed'.tr());
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
