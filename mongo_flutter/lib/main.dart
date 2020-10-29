import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'assessment.dart';

void main() => runApp(Assess());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getUsers() async {
    http.Response response = await http.get('http://10.0.2.2:4000/detail');
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
