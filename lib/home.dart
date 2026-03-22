import 'package:flutter/material.dart';

class TimeTrackHome extends StatefulWidget {
  const TimeTrackHome({super.key});

  @override
  State<TimeTrackHome> createState() => _TimeTrackHomeState();
}

class _TimeTrackHomeState extends State<TimeTrackHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Stopped', style: TextStyle(fontSize: 45),),
            Text('00:00', style: TextStyle(fontSize: 45),),
          ],
        ),
      ),
    );
  }
}
