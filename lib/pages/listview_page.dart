import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();
  int _lastItem = 0;
  List<int> _listNumbers = new List() /*[1, 2, 3, 4, 5]*/;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        /*_addTen();*/
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('lists')),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumbers[index];
          return FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'));
        },
      ),
    );
  }

  Future<Null> getPage() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _addTen();
    });

    return Future.delayed(duration);
  }

  void _addTen() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, callback);
  }

  void callback() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _addTen();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else
      return Container();
  }
}
