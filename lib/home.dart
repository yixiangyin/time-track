import 'dart:async';

import 'package:flutter/material.dart';

class TimeTrackHome extends StatefulWidget {
  const TimeTrackHome({super.key});

  @override
  State<TimeTrackHome> createState() => _TimeTrackHomeState();
}

class _TimeTrackHomeState extends State<TimeTrackHome> {
  int elapsedSeconds = 0;
  Timer? timer;

  String formatTime() {
    final minutes = elapsedSeconds ~/ 60;
    final seconds = elapsedSeconds % 60;
    final minuteText = minutes.toString().padLeft(2, '0');
    final secondText = seconds.toString().padLeft(2, '0');
    return '$minuteText:$secondText';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timer != null ? 'Working' : 'Stopped',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              formatTime(),
              style: TextStyle(fontSize: 45),
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              ElevatedButton(
                  onPressed: () {
                    if (timer != null) {
                      timer!.cancel();
                      setState(() {
                        timer = null;
                      });
                    } else {
                      setState(() {
                        timer = Timer.periodic(const Duration(seconds: 1), (_) {
                          setState(() {
                            elapsedSeconds += 1;
                          });
                        });
                      });
                    }
                  },
                  child: Text('Start/Stop'))
            ])
          ],
        ),
      ),
    );
  }
}
