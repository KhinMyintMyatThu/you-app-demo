import 'package:flutter/material.dart';

const boxGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(0xFF1F4247), Color(0xFF09141A)], // Define your colors
    begin: Alignment.topLeft, // Starting point of the gradient
    end: Alignment.bottomRight, // Ending point of the gradient
  ),
);

 const boxDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ));
