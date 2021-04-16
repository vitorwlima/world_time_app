import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {
              Navigator.pushReplacementNamed(context, '/location');},
              icon: Icon(Icons.edit_location),
              label: Text("Editar localização"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
          ),
          ]
        ),
      ),
    );
  }
}
