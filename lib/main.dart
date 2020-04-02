import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  Map data = await getData();
  var updateTime = data['data']['update_date_time'];
  var totalCasees = data['data']['local_total_cases'];
  var newCases = data['data']['local_new_cases'];
  var activeCases = data['data']['local_active_cases'];
  var hospitalizedCases =
  data['data']['local_total_number_of_individuals_in_hospitals'];
  var deaths = data['data']['local_deaths'];
  var recovered = data['data']['local_recovered'];
  print(data['data']);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('COVID-19'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:new Container(
        color: Colors.grey,
        child: new Center(
          child: new ListView(
            padding: const EdgeInsets.all(15.0),
            children: <Widget>[
              new ListTile(
                title: new Text('UpdateTime:$updateTime', style: new TextStyle(
                    fontSize:17.5,
                    color:Colors.orange,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),

              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: new Text("T"),
                ),
                title: new Text('TotalCasees', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.brown,
                    fontWeight:FontWeight.w500
                ),
                ),
                subtitle: new Text('$totalCasees', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.black,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),

              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: new Text("N"),
                ),
                title: new Text('NewCases', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.blueAccent,
                    fontWeight:FontWeight.w500
                ),
                ),
                subtitle: new Text('$newCases', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.black,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),

              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: new Text("A"),
                ),
                title: new Text('ActiveCases', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.deepOrange,
                    fontWeight:FontWeight.w500
                ),
                ),
                subtitle: new Text('$activeCases', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.black,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),

              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: new Text("H"),
                ),
                title: new Text('HospitalizedCases', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.yellow,
                    fontWeight:FontWeight.w500
                ),
                ),
                subtitle: new Text('$hospitalizedCases', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.black,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),

              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: new Text("D"),
                ),
                title: new Text('Deaths', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.red,
                    fontWeight:FontWeight.w500
                ),
                ),
                subtitle: new Text('$deaths', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.black,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),

              new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: new Text("R"),
                ),
                title: new Text('Recovered', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.green,
                    fontWeight:FontWeight.w500
                ),
                ),
                subtitle: new Text('$recovered', style: new TextStyle(
                    fontSize:19.5,
                    color:Colors.black,
                    fontWeight:FontWeight.w500
                ),
                ),
              ),
            ],



          ),
        ),
      ),
    ),

  ),
  );
}

Future<Map> getData() async {
  String apiURl = 'https://www.hpb.health.gov.lk/api/get-current-statistical';

  http.Response response = await http.get(apiURl);

  return json.decode(response.body);
}

