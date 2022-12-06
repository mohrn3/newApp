import 'dart:math' as math;

import 'package:flutter/material.dart';

MaterialColor randomColor() {
  var rand = new math.Random();
  var ichigo = rand.nextInt(5);
  MaterialColor re = Colors.pink;

  switch (ichigo) {
    case 0:
      re = Colors.pink;
      break;
    case 1:
      re = Colors.blue;
      break;
    case 2:
      re = Colors.indigo;
      break;
    case 3:
      re = Colors.cyan;
      break;
    case 4:
      re = Colors.blueGrey;
      break;
    case 5:
      re = Colors.green;
      break;
    case 6:
      re = Colors.brown;
      break;
    case 7:
      re = Colors.deepOrange;
      break;
    case 8:
      re = Colors.deepPurple;
      break;
    case 9:
      re = Colors.green;
      break;
    case 10:
      re = Colors.lime;
      break;

    default:
      print('【異常系】： switch文の引数になりえないデータです。');
      break;
  }
  return re;
}
