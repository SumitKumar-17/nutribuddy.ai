import 'package:flutter/material.dart';

//static variables can be accesed by class
class Themes{
  static final ThemeData theme=ThemeData(
      fontFamily: 'Itim',
      primaryColor: const Color.fromRGBO(43, 52, 103, 1),
      useMaterial3: true, //this adds some new features

      textTheme: const TextTheme(
          bodySmall:TextStyle(),
          bodyMedium:TextStyle(),
          bodyLarge:TextStyle())
          .apply(
        bodyColor:const Color.fromRGBO(43,52,103,1),
        displayColor:const Color.fromRGBO(43,52,103,1),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(43,52,103,1),
          titleTextStyle:TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.bold,
            fontFamily: 'Itim',
            fontSize:25,),
          iconTheme: IconThemeData(color:Colors.white)
      )
  );
}
