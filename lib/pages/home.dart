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

    Color corLetra1 = data['isDayTime'] ? Colors.grey[900] : Colors.grey[200];
    Color corLetra2 = data['isDayTime'] ? Colors.black : Colors.white;

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
                  icon: Icon(Icons.edit_location, color: corLetra1),
                  label: Text("Editar localização", style: TextStyle(color: corLetra1)),
              ),
                SizedBox(height: 40),
                Center(
                  child: Text(data['location'],
                  style: TextStyle(
                    fontSize: 30,
                    color: corLetra2
                  )),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: corLetra2
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
