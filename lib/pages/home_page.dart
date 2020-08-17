import 'package:flutter/material.dart';

import 'package:components/providers/menu_provider.dart';
import 'package:components/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: _list());
  }

  Widget _list() {
    //print(menuProvider.options);
    /*  menuProvider.loadData().then((options) {
      print('_list');
      print(options);
    }); */

    return FutureBuilder(
        future: menuProvider.loadData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listItems(List<dynamic> data, context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          /*final route = MaterialPageRoute(builder: (context) {
            return AlertPage();
          });
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
