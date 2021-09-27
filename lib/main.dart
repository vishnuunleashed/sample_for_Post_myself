import 'dart:convert';

import 'package:arunpractise/model.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nameHost=" ";
  PostSample sample = PostSample();
  PostSample samplenew = PostSample();

  TextEditingController _controller = TextEditingController();

  Future<PostSample> postData(String _name) async{

    var response = await http.post(Uri.parse(
      "https://reqres.in/api/users"),
      body: {
        "name" : _name,
      }
      );
    if(response.statusCode == 201){
      var jsonMap = jsonDecode(response.body);
      sample = PostSample.fromJson(jsonMap);
      print("successful");
    }else{
      print("Unsuccessful");
    }
    return sample;
  }


  String text;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            Container(child: Text("$text")),
            TextButton(onPressed: () async {
              nameHost = _controller.text;
              PostSample user= await postData(nameHost);

                samplenew = user;
                setState(() {
                  text = samplenew.name;
                });



              }, child: Container(child: Text("Press To Store"))),
          ],
        ),
      ),
    );
  }
}
