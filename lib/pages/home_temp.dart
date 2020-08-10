import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component App'),
      ),
      body: ListView(children: _createShort()
          /* <Widget>[
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Title'),
          ),
        ], */
          ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (String o in options) {
      final tempWidget = ListTile(
        title: Text(o),
      );

      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> _createShort() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
        title: Text(item + '!'),
        subtitle: Text('More+'),
        leading: Icon(Icons.account_balance_wallet),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){},
      ),
      Divider()
      ],
      );
    }).toList();
  }
}
