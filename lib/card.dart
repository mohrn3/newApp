// import 'dart:html';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:newnokosuios/controllers/login_controller.dart';
// import 'package:newnokosuios/final_Stage.dart';
import 'package:newnokosuios/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class CardDesign extends StatefulWidget {
  // final File ;

  final img_string;
  final description;
  final location;
  final Phy;
  final Emo;
  final Cul;
  final posNeg;

  // ImageData imageData;

  CardDesign(
      {this.img_string,
      this.description,
      this.location,
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
  // String categoryType = widget.category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: Colors.grey.shade900,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [Colors.green, Colors.blue])),
          ),

          actions: [
            FlatButton(
                onPressed: _captureSocialPng1,
                child: Text(
                  "Download",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                )),
          ],

          // title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(context),
                  // buildCard(model, context),
                  // buildCard(model, context),
                  // buildCard(model, context),
                  // buildCard(model, context),
                  // buildCard(model, context),
                  // buildCard(model, context),
                ],
              )),
        ));
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

    return Card(
      color: Colors.white,
      elevation: 4.0,
      // margin: EdgeInsets.zero,
      // clipBehavior: Clip.antiAlias,

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
                // color: Colors.grey.shade500,

                // color: Colors.orange.shade400,
              ),
            ),
            child: Column(
              children: [
                // ListTile(
                //   title: showCondition(),
                //   subtitle: PostiveNegative(),
                //   // trailing: Icon(Icons.favorite_outline),
                //   // trailing: showCondition(),
                // ),
                SizedBox(
                  //Use of SizedBox
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    padding: EdgeInsets.fromLTRB(5, 1, 0, 0),
                    // color: Colors.grey.shade200,
                    // width: MediaQuery.of(context).size.width * 0.8,
                    height: 32.0,
                    // child: Row(
                    //   children: [
                    //     // Align(
                    //     //   child: CircleAvatar(
                    //     //     backgroundImage:
                    //     //         Image.network(model.userDetails!.photoURL ?? "")
                    //     //             .image,
                    //     //     radius: 22,
                    //     //   ),
                    //     // ),
                    //     // SizedBox(
                    //     //   //Use of SizedBox
                    //     //   width: 10,
                    //     // ),
                    //     Align(
                    //       alignment: Alignment.center,
                    //       child: Text(UserName1,
                    //           style: const TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.bold)),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),

                SizedBox(
                  //Use of SizedBox
                  height: 8,
                ),
                ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10)),
                  child: Container(
                    // color: Colors.grey.shade200,
                    height: MediaQuery.of(context).size.height * 0.5,
                    // width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        // border: Border.all(
                        //   width: 2,
                        //   // color: Colors.white,
                        //   color: (widget.posNeg == "true")
                        //       ? Colors.orange.shade400
                        //       : Colors.purple.shade400,
                        //   // color: Colors.orange.shade400,
                        // ),
                        image: DecorationImage(
                          //  image: Image.asset('images/cat.png'),
                          image: Image.memory(base64Decode(widget.img_string))
                              .image,
                          fit: BoxFit.fitWidth,
                          // color: Colors.grey.shade200,
                        )),
                  ),
                ),

                ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(10),
                  //     bottomRight: Radius.circular(10)),
                  child: Container(
                    // width: MediaQuery.of(context).size.width * 0.8,

                    color: (widget.posNeg == "true")
                        ? Colors.red[300]
                        : Colors.blue.shade400,
                    height: 16.0,
                    child: Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        ),
                  ),
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 15,
                ),
                ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10)
                  //     ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    // width: MediaQuery.of(context).size.width * 0.8,

                    height: 30.0,
                    // color: Colors.grey.shade200,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 5,
                            child: Container(
                              child: showConditionPhysical(),
                            )),

                        Positioned(
                            left: 45,
                            child: Container(
                              child: showConditionCultural(),
                            )),

                        Positioned(
                            left: 85,
                            child: Container(
                              child: showConditionEmotional(),
                            )),
                        // showCondition(),

                        Positioned(
                          top: 7,
                          right: 15,
                          child: Container(
                              alignment: Alignment.center,
                              // alignment: Ali,
                              // color: Colors.grey.shade200,
                              // width: MediaQuery.of(context).size.width * 0.8,
                              // padding: EdgeInsets.all(8.0),
                              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                              child: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    // TextSpan(text: 'Our application already has'),
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
                              )
                              // Text(widget.location),

                              ),
                        ),

                        // Positioned(
                        //   right: 2,
                        //   child: Text(UserName1,
                        //       style: const TextStyle(color: Colors.black)),
                        // ),
                        // Positioned(
                        //   right: 2,
                        //   child: Text(             formattedDate,
                        //       style: const TextStyle(color: Colors.black)),
                        // ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   //Use of SizedBox
                //   height: 20,
                // ),
                // Container(
                //   color: (widget.posNeg == "true")
                //       ? Colors.orange.shade400
                //       : Colors.purple.shade400,
                //   height: 50.0,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //   ),
                // ),

                ClipRRect(
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    // color: Colors.grey.shade100,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // padding: EdgeInsets.all(8.0),
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
                  // padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
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

                        // child: FlatButton(
                        //   child: Text(
                        //     'Download',
                        //     style: TextStyle(fontSize: 10.0),
                        //   ),
                        //   color: Colors.black,
                        //   textColor: Colors.white,
                        //   onPressed: _captureSocialPng1,
                        // ),

                        // child: IconButton(
                        //   icon: Icon(Icons.download),
                        //   iconSize: 20,
                        //   alignment: Alignment.centerRight,
                        //   onPressed: _captureSocialPng1,
                        // ),
                      ),
                    ],
                  ),
                ),
                // ButtonBar(
                //     // children: [
                //     //   TextButton(
                //     //     child: const Text('CONTACT AGENT'),
                //     //     onPressed: () {/* ... */},
                //     //   ),
                //     //   TextButton(
                //     //     child: const Text('LEARN MORE'),
                //     //     onPressed: () {/* ... */},
                //     //   )
                //     // ],
                //     ),
                // Positioned(
                //   child: IconButton(
                //     icon: Icon(Icons.download),
                //     iconSize: 32,
                //     alignment: Alignment.center,
                //     onPressed: _captureSocialPng1,
                //   ),
                // ),
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
      // return Icon(Icons.crop_square_outlined, color: Colors.blue);

      return ImageIcon(
        AssetImage("assets/nokosubox.png"),
        color: Colors.blue[700],
        size: 24,
      );
    } else {
      // return Icon(Icons.crop_square_outlined, color: Colors.grey.shade100);
      return ImageIcon(
        AssetImage("assets/nokosubox.png"),
        color: Colors.grey.shade300,
        size: 24,
      );
    }
  }

  showConditionCultural() {
    if (widget.Cul == "true") {
      // return Icon(Icons.circle, color: Colors.green);
      return ImageIcon(
        AssetImage("assets/nokosuearth.png"),
        color: Colors.teal,
        size: 24,
      );
    } else {
      // return Icon(Icons.circle, color: Colors.grey.shade100);

      return ImageIcon(
        AssetImage("assets/nokosuearth.png"),
        color: Colors.grey.shade300,
        size: 24,
      );
    }
  }

  showConditionEmotional() {
    if (widget.Emo == "true") {
      // return Icon(Icons.favorite_outline, color: Colors.red);
      return ImageIcon(
        AssetImage("assets/nokosuheart.png"),
        color: Colors.red.shade300,
        size: 24,
      );
    } else {
      // return Icon(Icons.favorite_outline, color: Colors.grey.shade100);
      return ImageIcon(
        AssetImage("assets/nokosuheart.png"),
        color: Colors.grey.shade300,
        size: 24,
      );
    }
  }

  // showCondition() {
  //   if (widget.category == "Cultural") {
  //     // PostiveNegative();
  //     return Icon(Icons.circle, color: Colors.green);
  //   } else if (widget.category == "Physical") {
  //     // PostiveNegative();
  //     return Icon(Icons.circle, color: Colors.blue);
  //   } else {
  //     // PostiveNegative();
  //     return Icon(Icons.favorite_outline, color: Colors.red);
  //   }
  // }

  Future<void> _captureSocialPng1() {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return new Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;

      ui.Image image = await boundary!.toImage(pixelRatio: 2.0);
      // ui.Image image = await boundary!.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      File imgFile = new File('$directory/nokosu_${DateTime.now()}.png');
      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes).then((value) async {
        await Share.shareFiles(imagePaths,
            subject: 'Share',
            text: 'Check this Out!',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }).catchError((onError) {
        print(onError);
      });
    });
  }
}
