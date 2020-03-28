import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class DetialPage extends StatelessWidget {
  var videos;
  final video;
  DetialPage(this.video);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detail Page")),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Image.network(video["imageUrl"]),
                  new Container(
                    height: 8.0,
                  ),
                  new Text(
                    video["name"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            new Divider()
          ],
        ),
      ),
    );
  }
}
