import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                onPressed: () {
                Navigator.pushNamed(context, '/location');},
                icon: Icon(Icons.edit_location),
                label: Text("Editar localização"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
              SizedBox(height: 40),
              Center(
                child: Text(data['location'],
                style: TextStyle(
                  fontSize: 30,
                )),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(data['time'],
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
