import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuiz_app/screens/register_screen.dart';
import 'package:kuiz_app/screens/splash_screen.dart';
import 'package:kuiz_app/services/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  String? errorMessage;

 

  Future<void> signIn() async {
    try {
      await Auth().signIn(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(19, 22, 33, 1),
      ),
      backgroundColor: const Color.fromRGBO(19, 22, 33, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  "Login \nyour Account",
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(67, 70, 80, 1),
                    labelText: "Enter Your Email",
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(194, 195, 203, 1)),
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Color.fromRGBO(194, 195, 203, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(67, 70, 80, 1),
                    labelText: "Password",
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(194, 195, 203, 1)),
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Color.fromRGBO(194, 195, 203, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                errorMessage != null
                    ? Text(errorMessage!,style: const TextStyle(color: Colors.amber),)
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                         
                            signIn();
                         
                        },
                        child: const Text("Login")
                            ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );

                        },
                        child: const Text(
                          "Hesabin yoxdur?Klikle",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 61,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(16, 46, 83, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: null,
                        child: SvgPicture.asset("assets/images/google.svg"),
                      ),
                    ),
                    Container(
                      height: 61,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(16, 46, 83, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: null,
                        child: SvgPicture.asset("assets/images/apple.svg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
