import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 10.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.deepOrange,
        label: 'Size image',
        //divisions: 10,
        value: _valueSlider,
        min: 10.0,
        max: 100.0,
        onChanged: (_blockCheck)
            ? null
            : (value) {
                setState(() {
                  _valueSlider = value;
                });
              });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    /* return Checkbox(
        value: _blockCheck,
        onChanged: (value) {
          _blockCheck = value;
        }); */

    return CheckboxListTile(
        title: Text('Block Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        }
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(
        title: Text('Block Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        }
    ); 
  }
}
