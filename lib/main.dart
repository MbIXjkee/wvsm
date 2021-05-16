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

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              // child: isLoading ? Loader() : Profile(),
              child: isLoading ? buildLoader() : buildProfile(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => isLoading = !isLoading),
      ),
    );
  }

  Widget buildLoader() {
    return Icon(
      Icons.timer,
      size: 100,
    );
  }

  Widget buildProfile() {
    return Icon(
      Icons.supervised_user_circle,
      size: 100,
    );
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.timer,
      size: 100,
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.supervised_user_circle,
      size: 100,
    );
  }
}
