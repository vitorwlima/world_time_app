import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url, this.isDayTime });


  Future <void> getData() async {

    try {

      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);

      isDayTime = now.hour > 5 && now.hour < 19;

    }
    catch (e) {
      print("erro identificado: $e");
      time = "Não foi possível obter os dados.";
    }


  }

}