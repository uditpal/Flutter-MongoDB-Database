import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Assess extends StatefulWidget {
  @override
  _AssessState createState() => _AssessState();
}

enum gender { Male, Female, Other }

class _AssessState extends State<Assess> {
  getUsers() async {
    http.Response response = await http.get('http://10.0.2.2:4000/Quest');
    print(response.body);
  }

  String age;
  String gen = 'Male';
  var symptoms = new List();
  String person;
  String place;
  String history;
  TextEditingController old = new TextEditingController();
  TextEditingController condition = new TextEditingController();

  sendUsers() async {
    Map data = {
      "Age": age,
      "Gender": gen,
      "Symptom": symptoms,
      "Person": person,
      "Place": place,
      "History": history,
    };

    String body = json.encode(data);

    http.Response response1 = await http.post(
      'http://10.0.2.2:4000/detail',
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    debugPrint(response1.body);
  }

  gender _character = gender.Male;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  'Enter your age',
                  style: TextStyle(fontSize: 20),
                )),
                Expanded(
                    child: TextField(
                  controller: old,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'How old are you?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Text(
                    'Select gender',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Radio(
                  value: gender.Male,
                  groupValue: _character,
                  onChanged: (gender value) {
                    setState(() {
                      _character = value;
                      gen = "Male";
                    });
                  },
                ),
                Text(
                  'Male',
                  style: new TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: gender.Female,
                  groupValue: _character,
                  onChanged: (gender value) {
                    setState(() {
                      _character = value;
                      gen = "Female";
                    });
                  },
                ),
                Text(
                  'Female',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Radio(
                  value: gender.Other,
                  groupValue: _character,
                  onChanged: (gender value) {
                    setState(() {
                      _character = value;
                      gen = "Other";
                    });
                  },
                ),
                Text(
                  'Other',
                  style: new TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Select all symptoms that you have",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                buildContainer("Fever", () => symptoms.add("Fever")),
                SizedBox(
                  width: 20,
                ),
                buildContainer("Fatigue", () => symptoms.add("Fatigue")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                buildContainer("Cough", () => symptoms.add("Cough")),
                SizedBox(
                  width: 20,
                ),
                buildContainer("Headache", () => symptoms.add("Headache")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                buildContainer("Shortness of Breath",
                    () => symptoms.add("Shortness of Breath")),
                SizedBox(
                  width: 20,
                ),
                buildContainer(
                    "Sputum Prduction", () => symptoms.add("Sputum Prduction")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                buildContainer("Diarrhea", () => symptoms.add("Diarrhea")),
                SizedBox(
                  width: 20,
                ),
                buildContainer("No Symptoms", () {
                  symptoms.clear();
                  symptoms.add("No Symptoms");
                }),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Have you come in close contact witha COVID-19 infected person in last 14 days?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                buildContainer("Yes", () => person = "Yes"),
                SizedBox(
                  width: 20,
                ),
                buildContainer("No", () => person = "No"),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "Have you traveled to COVID-19 affected countries/regions in last 14 days?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                buildContainer("Yes", () => place = "Yes"),
                SizedBox(
                  width: 20,
                ),
                buildContainer("No", () => place = "No"),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "Any pre existing health condition/ current medication?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: condition,
                    decoration: InputDecoration(
                      hintText: ("Type Here"),
                      hintStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              borderSide: BorderSide(
                color: Colors.blue[700],
              ),
              onPressed: () {
                age = old.text;
                history = condition.text;
                debugPrint(age);
                debugPrint(symptoms.toString());
                debugPrint(person);
                debugPrint(place);
                debugPrint(history);
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(String val, Function prop) {
    return Container(
      height: 50,
      width: 180,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue[700],
        ),
        onPressed: prop,
        child: Text(
          val,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
