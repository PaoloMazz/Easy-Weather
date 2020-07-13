import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);
const kNameTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 55.0,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);
const kMessageTextStyleLista = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25.0,
);
const kMessageTextStyleFine = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25.0,
);
const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);
const kConditionTextStyle = TextStyle(
  fontSize: 30.0,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  contentPadding: EdgeInsets.only(bottom: 40),
  fillColor: Colors.black12,
  hintText: 'Inserisci città',
  hintStyle: TextStyle(
    color: Colors.white70,
//    fontFamily: 'Spartan MB',
    fontSize: 10,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
//    borderSide: BorderSide.none,
  ),
);
