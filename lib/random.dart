import 'dart:math' as math;

import 'package:flutter/material.dart';

Color randomColor() {
  var rand = new math.Random();
  var ichigo = rand.nextInt(5);
  Color re = Color(0xffffcabf);

  switch (ichigo) {
    case 0:
      re = Color(0xffffcabf);
      break;
    case 1:
      re = Colors.blue;
      break;
    case 2:
      re = Colors.indigo.shade400;
      break;
    case 3:
      re = Color(0xffff8082);
      break;
    case 4:
      re = Colors.blueGrey;
      break;
    case 5:
      re = Colors.green;
      break;
    case 6:
      re = Colors.brown.shade500;
      break;
    case 7:
      re = Colors.deepOrange.shade300;
      break;
    case 8:
      re = Colors.deepPurple.shade400;
      break;
    case 9:
      re = Color(0xffd8f255);
      break;
    case 10:
      re = Color(0xffbfe4ff);
      break;
    case 11:
      re = Color(0xffffff80);
      break;
    case 12:
      re = Colors.pinkAccent.shade200;
      break;
    case 13:
      re = Color(0xffffca80);
      break;
    case 14:
      re = Color(0xff77d9a8);
      break;
    case 15:
      re = Color(0xffc9ace6);
      break;
    case 16:
      re = Color(0xffff4b00);
      break;
    case 17:
      re = Color(0xff03af7a);
      break;
    case 18:
      re = Color(0xff005aff);
      break;
    case 19:
      re = Color(0xff4dc4ff);
      break;
    case 20:
      re = Color(0xfff6aa00);
      break;
    case 21:
      re = Color(0xff990099);
      break;
    case 22:
      re = Colors.teal;
      break;

    default:
      print('【異常系】： switch文の引数になりえないデータです。');
      break;
  }
  return re;
}
