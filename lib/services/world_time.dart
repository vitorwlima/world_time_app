import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.flag, this.url });


  Future<void> getData() async {

    try {

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = now.toString();

    }
    catch (e) {
      print("erro identificado: $e");
      time = "Não foi possível obter os dados.";
    }


  }

}