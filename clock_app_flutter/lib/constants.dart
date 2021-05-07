import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration timerContDec(context){
  return BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).accentColor,
          offset: Offset(2, 2),
          blurRadius: 4,
        )
      ]);
}