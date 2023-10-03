import 'package:ai_job_matcher/constants/contactcolors.dart';
import 'package:ai_job_matcher/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A2947),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Color(0xffD8D8D8), fontSize: 24),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 182, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfffbd512),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigate the user to the Home page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please fill input')),
                                );
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: cardColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Already Registered?',
                        style: TextStyle(color: Color(0xffA7A7A7)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Color(0xffFBD512)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
