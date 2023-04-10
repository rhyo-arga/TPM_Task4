import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  DateFormat _formatter = DateFormat('mm:ss.S');
  String _display = '00:00.0';

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), _updateDisplay);
  }

  void _updateDisplay(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {
        _display = _formatter.format(DateTime(0).add(_stopwatch.elapsed));
      });
    }
  }

  void _toggleStopwatch() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
        _timer.cancel();
      } else {
        _stopwatch.start();
        _startTimer();
      }
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _display = '00:00.0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Stopwatch"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _display,
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StopwatchButton(
                    text: _stopwatch.isRunning ? 'STOP' : 'START',
                    onPressed: _toggleStopwatch,
                  ),
                  StopwatchButton(
                    text: 'RESET',
                    onPressed: _resetStopwatch,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

class StopwatchButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const StopwatchButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onPressed(),
          ),
        ],
      ),
    );
  }
}
