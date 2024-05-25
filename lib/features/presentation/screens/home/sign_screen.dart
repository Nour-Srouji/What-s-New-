import 'package:flutter/material.dart';
import 'package:news_app/features/presentation/screens/home/login_screen.dart';

class signin_Screen extends StatefulWidget {
  @override
  State<signin_Screen> createState() => _signin_ScreenState();
}

class _signin_ScreenState extends State<signin_Screen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                //***************************** */
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Firs Name',
                    border: OutlineInputBorder(),
                  ),
                ),

                /********************* */
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                    //  prefixIcon: Icon(Icons.email),
                  ),
                ),
                //************************************ */
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email ',
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
                  width: double.infinity,
                  color: Colors.red,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()));
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    child: const Text("sign in",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
