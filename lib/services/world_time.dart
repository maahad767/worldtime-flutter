import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  late bool isDayTime;
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data =  jsonDecode(response.body);
      DateTime currentTime = DateTime.parse(data['utc_datetime']);
      List<String> offsets = data['utc_offset'].split(":");
      currentTime = currentTime.add(Duration(hours: int.parse(offsets[0]), minutes: int.parse(offsets[1])));
      isDayTime = currentTime.hour < 18 && currentTime.hour > 6 ? true : false;
      time = DateFormat.jm().format(currentTime);
    } catch (e) {
      print(e);
      isDayTime = false;
      time = "failed to load";
    }
  }
}
