import 'dart:io';

import 'package:flutter/material.dart';

class ViewImageScreen extends StatefulWidget {
  final String imageFle;
  ViewImageScreen({Key? key, required this.imageFle}) : super(key: key);

  @override
  _ViewImageScreenState createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        image: FileImage(File(widget.imageFle)),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
