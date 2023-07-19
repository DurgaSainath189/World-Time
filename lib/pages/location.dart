// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'abidjan.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: 'algiers.png'),
    WorldTime(url: 'Pacific/Apia', location: 'Apia', flag: 'apia.png'),
    WorldTime(url: 'Pacific/Auckland', location: 'Auckland', flag: 'auckland.png'),
    WorldTime(url: 'Africa/Bissau', location: 'Bissau', flag: 'bissau.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'bangkok.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'berlin.png'),
    WorldTime(url: 'Atlantic/Bermuda', location: 'Bermuda', flag: 'bermuda.png'),
    WorldTime(url: 'Pacific/Bougainville', location: 'Bougainville', flag: 'bougainville.png'),
    WorldTime(url: 'Europe/Brussels', location: 'Brussels', flag: 'brussels.png'),
    WorldTime(url: 'Africa/Ceuta', location: 'Ceuta', flag: 'ceuta.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'casablanca.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'casablanca.png'),
    WorldTime(url: 'Indian/Chagos', location: 'Chagos', flag: 'chagos.png'),
    WorldTime(url: 'Asia/Colombo', location: 'Colombo', flag: 'colombo.png'),
    WorldTime(url: 'Australia/Darwin', location: 'Darwin', flag: 'darwin.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Dhaka', flag: 'dhaka.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.png'),
    WorldTime(url: 'Europe/Dublin', location: 'Dublin', flag: 'dublin.png'),
    WorldTime(url: 'Pacific/Fiji', location: 'Fiji', flag: 'fiji.png'),
    WorldTime(url: 'Pacific/Gambier', location: 'Gambier', flag: 'gambier.png'),
    WorldTime(url: 'Europe/Gibraltar', location: 'Gibraltar', flag: 'gibraltar.png'),
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki', flag: 'helsinki.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hongkong.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'istanbul.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'jakarta.png'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flag: 'jamaica.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'johannesburg.png'),
    WorldTime(url: 'Asia/Kabul', location: 'Kabul', flag: 'kabul.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'karachi.png'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'kathmandu.png'),
    WorldTime(url: 'Pacific/Kiritimati', location: 'Kiritimati', flag: 'kiritimati.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'kolkota.png'),
    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon', flag: 'lisbon.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los_Angeles', flag: 'losangels.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'madrid.png'),
    WorldTime(url: 'Indian/Maldives', location: 'Maldives', flag: 'maldives.png'),
    WorldTime(url: 'Indian/Mauritius', location: 'Mauritius', flag: 'mauritius.png'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'melbourne.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'mexico.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'moscow.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'newyork.png'),
    WorldTime(url: 'Pacific/Noumea', location: 'Noumea', flag: 'noumea.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'paris.png'),
    WorldTime(url: 'Australia/Perth', location: 'Perth', flag: 'perth.png'),
    WorldTime(url: 'America/Indiana/Petersburg', location: 'Petersburg', flag: 'petersburg.png'),
    WorldTime(url: 'Europe/Prague', location: 'Prague', flag: 'prague.png'),
    WorldTime(url: 'Pacific/Rarotonga', location: 'Rarotonga', flag: 'rarotonga.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'rome.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'shanghai.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Europe/Sofia', location: 'Sofia', flag: 'sofia.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'sydney.png'),
    WorldTime(url: 'Asia/Taipei', location: 'Taipei', flag: 'taipei.png'),
    WorldTime(url: 'Europe/Tirane', location: 'Tirane', flag: 'tirane.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.png'),
    WorldTime(url: 'Pacific/Tongatapu', location: 'Tongatapu', flag: 'tonga.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'toronto.png'),
    WorldTime(url: 'Europe/Vienna', location: 'Vienna', flag: 'vienna.png'),
    WorldTime(url: 'Europe/Warsaw', location: 'Warsaw', flag: 'warsaw.png'),
    WorldTime(url: 'Asia/Yangon', location: 'Yangon', flag: 'yangon.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context ,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDay':instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 6),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
