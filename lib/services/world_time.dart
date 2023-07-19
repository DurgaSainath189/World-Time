import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location="";
  String time="";
  String flag="";
  String url="";
  bool isDay=true;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {

    try{
      //make the request to the worldtime api
      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data=jsonDecode(response.body);
      print(data);

      //getting the utc_datetime and utc_offset properties from the map object
      String datetime=data['utc_datetime'];
      String hrs_offset=data['utc_offset'].substring(1,3);
      String min_offset=data['utc_offset'].substring(4,);
      // print(datetime);
      // print(offset);

      //convert this into datatime object
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(hrs_offset),minutes: int.parse(min_offset)));

      isDay=now.hour>6 && now.hour<20?true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print("Caught an error : $e");
      time="Could not load date and time";
    }
  }
}