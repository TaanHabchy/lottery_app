import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Jobs'),
          backgroundColor: lotteryGreen,
        ),
        body: Column(
          children: [
            Text(username),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back!"),
              ),
            ),
          ],
        ));
  }
}
