import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
};

Icon getIcon(String nameicon) {
  return Icon(_icons[nameicon], color: Colors.blue);
}
