import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import './pages/video_cell.dart';
import './pages/detial_page.dart';

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RealWorldAppState();
  }
}

class _RealWorldAppState extends State<RealWorldApp> {
  var _isLoading = true;
  var videos;
  
  _fetchData() async {
    print("Fetch called");
    final url = "https://api.letsbuildthatapp.com/youtube/home_feed";
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final map = json.decode(res.body);
      final videosJson = map["videos"];

      // print(map["videos"]);
      setState(() {
        _isLoading = false;
        this.videos = videosJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("REAL WORLD APP"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
                print("Something Reloading");
              },
            )
          ],
        ),
        body: new Center(
            child: _isLoading
                ? new CircularProgressIndicator()
                : new ListView.builder(
                    itemCount: this.videos != null ? this.videos.length : 0,
                    itemBuilder: (context, i) {
                      final video = this.videos[i];
                      return new FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => DetialPage(video),
                                ));
                          },
                          child: new VideoCell(video));
                    },
                  )),
      ),
    );
  }
}
