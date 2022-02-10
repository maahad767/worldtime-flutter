import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    loadTime();
  }

  void loadTime() async {
    WorldTime instance = WorldTime(location: "Dhaka", flag: "bangladesh.png", url: "Asia/Dhaka");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      // 'instance': instance,
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitPulse(
        color: Colors.blueGrey[900],
      ),
    );
  }
}
