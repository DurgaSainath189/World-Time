// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage=data['isDay']?'day.jpg':'night.jpg';
    Color? bgColor=data['isDay']? Colors.lightBlue[100]: Colors.deepPurple[900];
    Color textcolor=data['isDay']?Colors.black:Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,250,0,0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/${data['flag']}'),
                        ),
                        SizedBox(width: 20),
                        Text(
                          data['location'],
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 30,
                            fontFamily: 'Acme',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 66,
                    fontFamily: 'Acme',
                    letterSpacing: 2,
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'flag':result['flag'],
                        'isDay':result['isDay'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location_alt_outlined,
                    color: textcolor,
                  ),
                  label: Text(
                    "Change Location",
                    style: TextStyle(
                      color: textcolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
