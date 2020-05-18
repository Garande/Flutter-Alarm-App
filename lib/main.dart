import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Alarm App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  DateTime _dateTime = DateTime.now();

  int countDown = 0;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer.periodic(Duration(seconds: 100), (timer) {
      updateCurrentTime(timer);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // '$countDown',
              '${DateFormat.E("H:Hm:Hms").format(_dateTime)}',
              style: Theme.of(context).textTheme.display1,
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.display1,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  getStringFromInt(int number) {
    if (number <= 9) {
      return '0' + number.toString();
    } else {
      return number.toString();
    }
  }

  void updateCurrentTime(Timer timer) {
    // print(timer.tick);
    setState(() {
      _dateTime = DateTime.now();
    });
  }
}
