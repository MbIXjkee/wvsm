import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                accentColor: Colors.red,
              ),
              child: testWidget,
            ),
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                accentColor: Colors.green,
              ),
              child: testWidget,
            ),
          ),
          Expanded(child: testWidget),
        ],
      ),
    );
  }
}

const testWidget = MyTestWidget();

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
