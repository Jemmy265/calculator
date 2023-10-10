import 'package:flutter/material.dart';

class button extends StatefulWidget {
  String text;
  Function onButtonclick;

  button({required this.text, required this.onButtonclick});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey[850],
        child: InkWell(
            onTap: () {
              widget.onButtonclick(widget.text);
            },
            child: Text(
              "${widget.text}",
              style: TextStyle(fontSize: 28),
            )),
      ),
    ));
  }
}
