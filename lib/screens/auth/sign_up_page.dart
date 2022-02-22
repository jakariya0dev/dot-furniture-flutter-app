import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'User Signup',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'User name',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'User phone',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: mailController,
                decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'abc@mail.com',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'User Password',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  userSignUp();
                  saveUesrData();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Sign up'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text('Log in'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  userSignUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: mailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  saveUesrData() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(mailController.text).set({
      'email': mailController.text,
      'name': userController.text,
      'phone': phoneController.text,
      'password': passwordController.text
    });
    print('method called');
  }
}
