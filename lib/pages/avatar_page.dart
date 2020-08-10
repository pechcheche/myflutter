import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage('https://github.com/pechcheche/flutter-listview/blob/master/Screenshot.png'),
          ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('data'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://github.com/pechcheche/flutter-listview/blob/master/Screenshot.png'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}