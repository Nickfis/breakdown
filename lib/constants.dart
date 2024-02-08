import 'package:flutter/material.dart';

InputDecoration kInputDecoration = InputDecoration(
  labelText: "Current amount",
  labelStyle: TextStyle(color: Colors.grey.shade900),
  floatingLabelStyle: const TextStyle(color: Colors.white),
  fillColor: const Color.fromARGB(138, 182, 198, 163),
  filled: true,
  errorStyle: TextStyle(color: Colors.red.shade500, fontSize: 17.0),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
);
