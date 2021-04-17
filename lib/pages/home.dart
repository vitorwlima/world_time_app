import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    String bgImg = data['isDayTime'] ? 'bg-dia.png' : 'bg-noite.png';
    print(data);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
                fit: BoxFit.cover
          )
        )
        ,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton.icon(
                  onPressed: () {
                  Navigator.pushNamed(context, '/location');},
                  icon: Icon(Icons.edit_location, color: Colors.grey[200]),
                  label: Text("Editar localização", style: TextStyle(color: Colors.grey[200])),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
                SizedBox(height: 40),
                Center(
                  child: Text(data['location'],
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  )),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
