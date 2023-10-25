import 'package:flutter/material.dart';
import 'home_page.dart';
import 'employee_data.dart';

void main() {
  runApp(const MyApp());
}

var lotteryGreen = const Color.fromARGB(225, 2, 50, 24);

///
/// Just the main app
///

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const Login(title: "Texas State Lottery"),
    );
  }
}

///
///
///
class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // var lotteryGreen = const Color.fromARGB(225, 2, 50, 24);
  MyHashMap myHashMap = MyHashMap();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: lotteryGreen,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),

                ///
                ///Username entry
                ///
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),

                ///
                ///Password Entry
                ///
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(lotteryGreen)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (myHashMap.data
                                .containsKey(usernameController.text) &&
                            myHashMap.data[usernameController.text] ==
                                passwordController.text) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      username: usernameController.text,
                                    )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid Credentials')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
