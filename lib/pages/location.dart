import 'package:flutter/material.dart';
import 'package:flu_time_api/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Accra', location: 'Ghana', flag: 'ghana.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'chicago.png'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: 'new_york.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'seoul.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'jakarta.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assests/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
