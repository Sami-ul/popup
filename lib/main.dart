import 'dart:ui';
import 'package:flutter/material.dart';

// Style for our elevated button
// Rounded corners and padding
var buttonStyle = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))));

class Popup extends StatelessWidget {
  Popup(
    String this.message, {
    Key? key,
  }) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        color: Colors.black.withOpacity(0.1),
        child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(25))),
            title: Center(child: Text(message)), // What the text will be
            actions: [
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pop(context); // Allows the user to close the popup
                },
                child: const Text('Close'),
              ),
            ]),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'Page',
      home: Page(),
    ),
  );
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          style: buttonStyle,
          child: Text("Show Popup"),
          onPressed: () {
            showDialog(context: context, builder: (context) => Popup("Hello!"));
          }),
    ));
  }
}
