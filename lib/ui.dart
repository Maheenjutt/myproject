import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              textAlign: TextAlign.left,
              "Email",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(labelText: 'Enter Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: const InputDecoration(labelText: 'Enter Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Forgot password"),
            ElevatedButton(
                onPressed: () {
                  _showMyDialog();
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 255, 230, 0)))),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 230, 0))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 24),
                  ),
                )),
            const Text("or"),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 77, 73, 73)))),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 77, 73, 73))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    "Login with Google",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text("Don't have an account?"),
            const Text(
              "Sign up",
              style: TextStyle(color: Color.fromARGB(255, 255, 230, 0)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Email and password'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please enter valid email and password'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
