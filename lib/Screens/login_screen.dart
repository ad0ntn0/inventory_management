import 'package:flutter/material.dart';
import 'package:inventory_management/Screens/inventory_browser_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(gradient: RadialGradient(center: Alignment.topCenter,colors: [Colors.black26, Color(0xFF111115)])),

        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('INVENTORY MANAGER', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'e-mail'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'password'),
                    ),
                  ),
                  ButtonBar(
                    children: [
                      const Text('Not registered yet?'),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Sign up'),
                      ),
                      ElevatedButton(onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InventoryBrowser(),
                        ),
                      );}, child: const Text('Sign in'))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
