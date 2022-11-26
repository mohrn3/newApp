// import 'dart:html';
// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newnokosuios/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'random.dart';

class CardDesign extends StatefulWidget {
  // final File ;

  final img_string;
  final person;
  final description;
  // final location;
  final Phy;
  final Emo;
  final Cul;
  final posNeg;

  CardDesign(
      {this.img_string,
      this.person,
      this.description,
      // this.location,
      this.Phy,
      this.Emo,
      this.Cul,
      this.posNeg});

  @override
  _CardDesignState createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  GlobalKey previewContainer = new GlobalKey();
  bool click = true;
  MaterialColor turn = randomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < 2; i++)
                Container(
                  // color: i.isEven ? Colors.blue : Colors.pink,
                  color: turn,
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       flexibleSpace: Container(
    //         color: Colors.grey.shade900,
    //       ),
    //       actions: [
    //         FlatButton(
    //             onPressed: _captureSocialPng1,
    //             child: Text(
    //               "Download",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 12.0),
    //             )),
    //       ],
    //     ),
    //     body: Container(
    //       padding: EdgeInsets.all(16.0),
    //       child: SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             children: [
    //               buildCard(context),
    //             ],
    //           )),
    //     ));
  }

  Card buildCard(context) {
    // String UserName1 = model.userDetails!.displayName ?? "";
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    String formattedDate1 = DateFormat.yMMMMEEEEd().add_jms().format(now);

    var heading = '\$2300 per month';
    var subheading = '2 bed, 1 bath, 1300 sqft';
    var cardImage =
        NetworkImage('https://source.unsplash.com/random/800x600?house');
    var supportingText = widget.description;
    var title = widget.person;

    return Card(
      color: Colors.white, //カードの四角
      elevation: 4.0,

      // elevation: 4.0,
      child: RepaintBoundary(
        key: previewContainer,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  //Use of SizedBox
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 1, 0, 0),
                    height: 32.0,
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 8,
                ),
                ClipRRect(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        image: DecorationImage(
                          image: Image.memory(base64Decode(widget.img_string))
                              .image,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                ClipRRect(
                  child: Container(
                    color: (widget.posNeg == "true")
                        ? Colors.red[300]
                        : Colors.blue.shade400,
                    height: 16.0,
                    child: Row(),
                  ),
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 15,
                ),
                ClipRRect(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    height: 30.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            // left → right
                            right: 95,
                            child: Container(
                              child: showConditionPhysical(),
                            )),
                        Positioned(
                            right: 55,
                            child: Container(
                              child: showConditionCultural(),
                            )),
                        Positioned(
                            right: 15,
                            child: Container(
                              child: showConditionEmotional(),
                            )),
                        /*Positioned(
                          top: 7,
                          right: 15,
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                              child: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                        alignment: ui.PlaceholderAlignment.top,
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.grey,
                                          size: 15,
                                        )),
                                    TextSpan(text: widget.location),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              )),
                        ),*/
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.centerLeft,
                    child: Text(supportingText,
                        style: const TextStyle(
                          fontFamily: 'RobotoMono',
                          color: Colors.black,
                          fontSize: 13,
                        )),
                  ),
                ),
                SizedBox(
                  //Use of SizedBox
                  width: 34,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.centerLeft,
                  child: Text(formattedDate1,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.black,
                        fontSize: 10,
                      )),
                ),
                Container(
                  height: 3.0,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PostiveNegative() {
    if (widget.posNeg == "true") {
      return Icon(Icons.circle, color: Colors.orange);
    } else {
      return Icon(Icons.circle, color: Colors.purple);
    }
  }

  showConditionPhysical() {
    if (widget.Phy == "true") {
      return ImageIcon(
        AssetImage("assets/nokosubox.png"),
        color: Colors.blue[700],
        size: 24,
      );
    } else {
      return ImageIcon(
        AssetImage("assets/nokosubox.png"),
        color: Colors.grey.shade300,
        size: 24,
      );
    }
  }

  showConditionCultural() {
    if (widget.Cul == "true") {
      return ImageIcon(
        AssetImage("assets/nokosuearth.png"),
        color: Colors.teal,
        size: 24,
      );
    } else {
      return ImageIcon(
        AssetImage("assets/nokosuearth.png"),
        color: Colors.grey.shade300,
        size: 24,
      );
    }
  }

  showConditionEmotional() {
    if (widget.Emo == "true") {
      return ImageIcon(
        AssetImage("assets/nokosuheart.png"),
        color: Colors.red.shade300,
        size: 24,
      );
    } else {
      return ImageIcon(
        AssetImage("assets/nokosuheart.png"),
        color: Colors.grey.shade300,
        size: 24,
      );
    }
  }

  Future<void> _captureSocialPng1() {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return new Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;

      ui.Image image = await boundary!.toImage(pixelRatio: 2.0);

      final directory = (await getApplicationDocumentsDirectory()).path;

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      File imgFile = new File('$directory/nokosu_${DateTime.now()}.png');

      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes).then((value) async {
        await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes),
            quality: 1000, name: 'nokosu-${DateTime.now()}.png');
      }).catchError((onError) {
        print(onError);
      }).whenComplete(() => showAlertDialog(context));

      // File imgFile = new File('$directory/nokosu_${DateTime.now()}.png');
      // imagePaths.add(imgFile.path);
      // imgFile.writeAsBytes(pngBytes).then((value) async {
      //   await Share.shareFiles(imagePaths,
      //       subject: 'Share',
      //       text: 'Check this Out!',
      //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      // }).catchError((onError) {
      //   print(onError);
      // });
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      onPressed: () {
        //Put your code here which you want to execute on No button click.
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content: Text("Image sucessfully saved in Gallery."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
