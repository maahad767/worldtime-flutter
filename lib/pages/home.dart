import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};
  late String bgImage;
  late Color textColor;

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    print(data);
    bgImage = data['isDayTime'] ? 'd.png' : 'night.png';
    textColor = data['isDayTime'] ? Colors.black54 : Colors.white60;

    return Scaffold(
      backgroundColor: textColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            children: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    dynamic updatedData =
                        await Navigator.pushNamed(context, '/chooseLocation');
                    setState(() {
                      data = {
                        'location': updatedData['location'],
                        'time': updatedData['time'],
                        'flag': updatedData['flag'],
                        'isDayTime': updatedData['isDayTime'],
                      };
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.edit_location_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Choose Location",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  data['location'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    letterSpacing: 1.5,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
