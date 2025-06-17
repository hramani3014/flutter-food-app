import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileappproject/appmain.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginpageState();
}
class _loginpageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // void _login() {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     // Handle login logic
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Logging in...')),
  //     );
  //   }
  // }
  bool a = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
              ),
              Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email Address';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value.toString())) {
                    return 'Enter Valid email address';
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: InkResponse(
                      onTap: () {
                        setState(() {
                          emailC.clear();
                        });
                      },
                      child: Icon(CupertinoIcons.multiply),
                    ),
                    // Icon(CupertinoIcons.multiply),
                    hintText: 'enter your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Password';
                  }
                },
                obscureText: a,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    suffixIcon: InkResponse(
                      onTap: () {
                        setState(() {
                          a = !a;
                        });
                      },
                      child: Icon(a ? CupertinoIcons.eye_slash:CupertinoIcons.eye),
                    ),
                    hintText: 'enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("email : ${emailC.text}");
                          print("password : ${passwordC.text}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logging in...')),
                          );
                          // _login();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => appMain()),
                          );
                        }
                      },
                      child: Text(
                        "login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
