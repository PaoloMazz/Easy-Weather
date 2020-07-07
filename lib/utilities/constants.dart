import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);
const kNameTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 40.0,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black12,
  hintText: 'Inserisci città',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'Spartan MB',
    fontSize: 10,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
