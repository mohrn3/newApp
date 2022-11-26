import 'dart:math' as math;

import 'package:flutter/material.dart';

MaterialColor randomColor() {
  var rand = new math.Random();
  var ichigo = rand.nextInt(5);
  MaterialColor re = Colors.pink;

  switch (ichigo) {
    case 0:
      // var lightpink = 0xffcabf;
      re = Colors.pink;
      break;
    case 1:
      // var pink = "0xff8082";
      re = Colors.blue;
      break;
    case 2:
      // var yellow = "0xffca80";
      re = Colors.yellow;
      break;
    case 3:
      // var red = "0xff4b00";
      re = Colors.cyan;
      break;
    case 4:
      // var blue = "0x4dc4ff";
      re = Colors.lightBlue;
      break;
    case 5:
      // gray
      re = Colors.green;
      break;
    default:
      print('【異常系】： switch文の引数になりえないデータです。');
      break;
  }
  return re;
}
