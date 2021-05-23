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
  Timer _timer;

  Count() : super(0) {
    _timer = Timer.periodic(Duration(seconds: 1), _tick);
  }

  void _tick(Timer timer) {
    value++;
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;

    super.dispose();
  }
}

class Counter extends InheritedNotifier {
  Counter({
    Key key,
    @required this.count,
    Widget child,
  })  : assert(count != null),
        super(key: key, child: child, notifier: count);

  final Count count;

  static Count of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Counter>().count;
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? const _HolderWidget()
            : const _CounterWidget(),
      ),
    );
  }

  Widget _buildCounter() {
    return Text('Count ${Counter.of(context).value}');
  }

  Widget _buildHolder() {
    return Text('Здесь могла быть ваша реклама');
  }
}

class _CounterWidget extends StatelessWidget {
  const _CounterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Count ${Counter.of(context).value}');
  }
}

class _HolderWidget extends StatelessWidget {
  const _HolderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Здесь могла быть ваша реклама');
  }
}
