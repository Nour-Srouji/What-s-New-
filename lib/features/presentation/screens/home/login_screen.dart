import 'package:flutter/material.dart';
import 'package:news_app/features/presentation/screens/home/first_interface.dart';
import 'package:news_app/features/presentation/screens/home/sign_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  height: 45,
                  width: double.infinity,
                  color: Colors.red,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => FirstInterface()));
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    child: const Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                // defaultButton(
                //     function: () {
                //       setState(() {

                //       });
                //       print(emailController.text);
                //       print(passwordController.text);
                //     },
                //     background: Colors.red,
                //     text: 'Login8885'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account'),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    signin_Screen()));
                          });
                        },
                        child: Text('Register now!'))
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
