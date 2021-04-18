import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:world_time_app/pages/loading.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'Londres', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Atenas', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'São Paulo', flag: 'brazil.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'Nova Iorque', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jacarta', flag: 'indonesia.png'),
  ];

  void setupWorldTime(index) async {
    WorldTime instance = WorldTime(location: locations[index].location, flag: locations[index].flag, url: locations[index].url);
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[600],
        title: Text("Escolha uma localização"),
        centerTitle: true,
        elevation: 0
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                child: ListTile(
                  onTap: () {
                    setupWorldTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: 19.5,
                        backgroundImage: AssetImage('assets/${locations[index].flag}')
                    ),
                  )
                ),
              )
            );
          }),
    );
  }
}
