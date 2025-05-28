import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kutuku/features/auth/manager/auth_event.dart';
import 'package:kutuku/features/auth/manager/auth_state.dart';
import 'package:kutuku/features/common/text_form_field_widget.dart';
import 'package:kutuku/features/common/text_widget.dart';
import 'package:kutuku/features/onboarding/page/elevated_button_widget.dart';

import '../manager/auth_bloc.dart';

class SignUpDetail extends StatelessWidget {
  SignUpDetail({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.idle) {
              _passwordController.clear();
              _emailController.clear();
              _userName.clear();
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(SnackBar(
                    content: Text("muvaffaqiytli ro'yxatdan o'tildi")));
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Create Account",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5),
                    TextWidget(
                      text: "Start learning with create your account",
                      color: Colors.black26,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextWidget(
                      text: "Username",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    TextFormFieldWidget(
                      controller: _userName,
                      hintText: "Create your username",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text: "Email or Phone Number",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormFieldWidget(
                      controller: _emailController,
                      hintText: "Enter your email or phone number",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text: "Password",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormFieldWidget(
                      controller: _passwordController,
                      hintText: "Create your password",
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButtonWidget(
                      text: "Create Account",
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthLoad(
                            username: _userName.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
