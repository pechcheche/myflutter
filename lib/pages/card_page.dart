import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _typeCard(),
          SizedBox(height: 30.0),
          _typeCard2(),
        ],
      ),
    );
  }

  Widget _typeCard() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_library, color: Colors.blue),
            title: Text('Card Title'),
            subtitle: Text('Lorem Impsum'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('Cancel'),
              ),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _typeCard2() {
  final card = Container(
        //clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[

            FadeInImage (
              placeholder: AssetImage('assets/loading.gif'),
              image:  NetworkImage('https://api.time.com/wp-content/uploads/2015/04/512137691.jpg'),
              fadeInDuration: Duration(milliseconds: 150),
              height: 300.0,
              fit: BoxFit.cover,
            ),

            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Hi'),
              )
          ],
        ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      )
    );
  }
}
