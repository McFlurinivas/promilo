import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:promilo/widgets/loginWidgets/divider_with_text.dart';

import '../widgets/loginWidgets/app_bar.dart';
import '../widgets/loginWidgets/email_field.dart';
import '../widgets/loginWidgets/password_field.dart';
import '../widgets/loginWidgets/options_row.dart';
import '../widgets/loginWidgets/submit_button.dart';
import '../widgets/loginWidgets/social_media_icons.dart';
import '../widgets/loginWidgets/footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isProcessing = false;

  Future<void> _login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final digest = sha256.convert(utf8.encode(password)).toString();

    final formData = {
      'username': email,
      'password': digest,
      'grant_type': 'password',
    };

    final response = await http.post(
      Uri.parse('https://apiv2stg.promilo.com/user/oauth/token'),
      headers: {
        'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: formData,
    );

    if (context.mounted) {
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, '/home');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged In Successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect User Credentials! Try Again.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Hi, Welcome Back!",
                        style: TextStyle(
                            color: Color(0xFF002a40),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Please Sign in to continue",
                          style:
                              TextStyle(color: Color(0xFF143b4f), fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 5),
                      EmailField(controller: emailController),
                      const SizedBox(height: 5),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Sign In With OTP",
                          style:
                              TextStyle(color: Color(0xFF06699c), fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style:
                              TextStyle(color: Color(0xFF143b4f), fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 5),
                      PasswordField(controller: passwordController),
                      const OptionsRow(),
                      const SizedBox(height: 20),
                      SubmitButton(
                        isProcessing: _isProcessing,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isProcessing = true;
                            });

                            await _login(context);

                            setState(() {
                              _isProcessing = false;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      const DividerWithText(text: 'or'),
                      const SizedBox(height: 20),
                      const SocialMediaIcons(),
                      const SizedBox(height: 30),
                      const Footer(),
                      const SizedBox(height: 20),
                      const Text("By continuing, you agree to",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Promilo's ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                          TextSpan(
                              text: "Terms of Use & Privacy Policy.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
