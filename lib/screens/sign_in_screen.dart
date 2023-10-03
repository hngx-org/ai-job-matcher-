import 'package:ai_job_matcher/constants/contactcolors.dart';
import 'package:ai_job_matcher/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A2947),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Sign In'),
      //   backgroundColor: Colors.deepPurple,
      // ),
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
                    height: 30,
                  ),
                  Text(
                    'Hello, Welcome back!',
                    style: TextStyle(
                        color: Color(0xffD8D8D8),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Login to continue',
                    style: TextStyle(
                        color: Color(0xffD8D8D8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 60,
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
                          hintText: "Email"),
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
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xffC2C2C2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28,
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
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please fill input')),
                                );
                              }
                            },
                            child: Text(
                              'Login',
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
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Or sign in with',
                    style: TextStyle(color: Color(0xffD8D8D8)),
                  ),
                  const SizedBox(
                    height: 24.5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: const Size.fromWidth(294),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/search.png',
                          scale: 4,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Login with Google',
                          style: TextStyle(color: Color(0xff303030)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23.81,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: const Size.fromWidth(291),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/facebook.png',
                          scale: 4,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Login with Facebook',
                          style: TextStyle(color: Color(0xff303030)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Color(0xffA7A7A7)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            'Register',
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
