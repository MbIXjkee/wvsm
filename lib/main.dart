import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Counter(
      count: Count(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TestPage(),
      ),
    );
  }
}

class Count extends ValueNotifier<int> {
  late Timer _timer;

  Count() : super(0) {
    _timer = Timer.periodic(Duration(seconds: 1), _tick);
  }

  void _tick(Timer timer) {
    value++;
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }
}

class Counter extends InheritedNotifier {
  Counter({
    Key? key,
    required this.count,
    required Widget child,
  })  : super(key: key, child: child, notifier: count);

  final Count count;

  static Count of(BuildContext context) {
    Counter? counter = context.dependOnInheritedWidgetOfExactType<Counter>();

    if (counter == null) {
      throw Exception('Counter not found');
    }

    return counter.count;
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}