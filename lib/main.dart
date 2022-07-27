import 'dart:ui';
import 'package:flutter/material.dart';

// Style for our elevated button
// Rounded corners and padding
var buttonStyle = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))));

class Popup extends StatelessWidget {
  // Parameter is message and this creates a popup with a blurred out background
  Popup(
    this.message, {
    // Parameter for the message we want
    Key? key,
  }) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      // Blurs the background
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        color: Colors.black.withOpacity(0.1),
        child: AlertDialog(
            shape: const RoundedRectangleBorder(
                // Rounded corners
                borderRadius:
                    const BorderRadius.all(const Radius.circular(25))),
            title: Center(child: Text(message)), // What the text will be
            actions: [
              ElevatedButton(
                style: buttonStyle, // Using the style we made
                onPressed: () {
                  Navigator.pop(context); // Allows the user to close the popup
                },
                child: const Text('Close'), // Text inside the button
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
          style: buttonStyle, // Using our style
          child: const Text("Show Popup"),
          onPressed: () {
            showDialog(
              // Flutter method for showing popups
              context: context,
              builder: (context) => Popup(
                  "Hello!"), // "Hello!" is the string that will show when we press the button
            );
          }),
    ));
  }
}
