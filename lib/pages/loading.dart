import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Brasil', flag: 'brazil.png', url: 'America/Sao_Paulo');
      await instance.getData();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
      });
}

  @override
    void initState() {
      super.initState();
      setupWorldTime();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text("Loading...", style: TextStyle(fontSize: 26))
      ),
    );
  }
}
