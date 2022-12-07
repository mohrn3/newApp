// import 'dart:html';
// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
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
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart' show rootBundle;

class CardDesign extends StatefulWidget {
  // final File ;

  final img_string;
  final person;
  final description;
  final comment1;
  final comment2;
  final comment3;
  final comment4;
  final comment5;
  final comment6;
  final comment7;
  // final location;
  final Phy;
  final Emo;
  final Cul;
  final posNeg;

  CardDesign(
      {this.img_string,
      this.person,
      this.description,
      this.comment1,
      this.comment2,
      this.comment3,
      this.comment4,
      this.comment5,
      this.comment6,
      this.comment7,
      // this.location,
      this.Phy,
      this.Emo,
      this.Cul,
      this.posNeg});

  @override
  _CardDesignState createState() => _CardDesignState();
}

enum Menu { download, home }

class _CardDesignState extends State<CardDesign> {
  GlobalKey previewContainer = new GlobalKey();
  bool click = true;
  Color turn = randomColor();
  var _selectedValue = 'Download';
  var _usStates = ["Download", "Home"];

  Uint8List bytes = Uint8List.fromList([0, 2, 5, 7, 42, 255]);
  final globalKey = GlobalKey();

  Future<void> widgetToImage() async {
    final boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return;
    }
    final image = await boundary.toImage(pixelRatio: 3.0);
    final directory = (await getApplicationDocumentsDirectory()).path;
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    // bytes = byteData!.buffer.asUint8List();
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    File imgFile = new File('$directory/cuttie_${DateTime.now()}.png');

    imgFile.writeAsBytes(pngBytes).then((value) async {
      await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes),
          quality: 1000, name: 'cuttie-${DateTime.now()}.png');
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() => showAlertDialog(context));
    // print(result);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate1 = DateFormat.yMMMMEEEEd().add_jms().format(now);
    var title = widget.person;
    var supportingText = widget.description;
    var commentText1 = widget.comment1;
    var commentText2 = widget.comment2;
    var commentText3 = widget.comment3;
    var commentText4 = widget.comment4;
    var commentText5 = widget.comment5;
    var commentText6 = widget.comment6;
    var commentText7 = widget.comment7;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(color: Colors.grey.shade900),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text(
          'Card',
          style: const TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back),
          //   padding: const EdgeInsets.only(left: 70),
          // ),
          PopupMenuButton<Menu>(
            onSelected: popupMenuSelected,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.download,
                child: Text('Download'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.home,
                child: Text('Home'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        //   child: RepaintBoundary(
        // key: globalKey,
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 70),
          scrollDirection: Axis.horizontal,
          child: RepaintBoundary(
            key: globalKey,
            child: Row(
              children: [
                //page 1 ------------------------
                Container(
                  color: turn,
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.8,
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Stack(
                          //   children: <Widget>[
                          //image
                          Neumorphic(
                            style: NeumorphicStyle(
                              intensity: 0.6,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.45,
                              decoration: BoxDecoration(
                                  border: Border.all(color: turn, width: 10),
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: Image.memory(
                                              base64Decode(widget.img_string))
                                          .image,
                                      fit: BoxFit.cover)),
                            ),
                          ),

                          // //posivive or negative
                          // Container(
                          //   child: PostiveNegative(),
                          // ),
                          //   ],
                          // ),

                          //icon
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
                            height: 65.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                    // left → right
                                    right: 120,
                                    child: Container(
                                      child: showConditionPhysical(),
                                    )),
                                Positioned(
                                    right: 80,
                                    child: Container(
                                      child: showConditionCultural(),
                                    )),
                                Positioned(
                                    right: 40,
                                    child: Container(
                                      child: showConditionEmotional(),
                                    )),
                              ],
                            ),
                          ),

                          //text
                          Neumorphic(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                // border: Border.all(color: turn, width: 10),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(title,
                                      style: const TextStyle(
                                        fontFamily: 'Noto_Sans_JP',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      )),
                                  Divider(
                                    thickness: 1,
                                    color: turn,
                                  ),
                                  Text(supportingText,
                                      style: const TextStyle(
                                        fontFamily: 'Noto_Sans_JP',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ),
                          ),

                          // //date
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          //   width: MediaQuery.of(context).size.width * 0.8,
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(formattedDate1,
                          //       style: const TextStyle(
                          //         fontFamily: '',
                          //         color: Colors.black,
                          //         fontSize: 13,
                          //       )),
                          // )
                        ],
                      ),

                      //posivive or negative
                      Container(
                        padding: EdgeInsets.all(10),
                        child: PostiveNegative(),
                      ),
                    ],
                  ),
                ),

                //page 2 ------------------------
                Container(
                  color: turn,
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.8,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/line3.png"),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 15, 0, 15),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText1,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText2,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText3,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText4,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText5,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText6,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.333,
                              height:
                                  MediaQuery.of(context).size.height * 0.108,
                              alignment: Alignment.center,
                              child: Text(commentText7,
                                  style: const TextStyle(
                                    fontFamily: 'Noto_Sans_JP',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
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

  // Card buildCard(context) {
  //   // String UserName1 = model.userDetails!.displayName ?? "";
  //   DateTime now = DateTime.now();
  //   String formattedDate = DateFormat('yyyy-MM-dd').format(now);

  //   String formattedDate1 = DateFormat.yMMMMEEEEd().add_jms().format(now);

  //   var heading = '\$2300 per month';
  //   var subheading = '2 bed, 1 bath, 1300 sqft';
  //   var cardImage =
  //       NetworkImage('https://source.unsplash.com/random/800x600?house');
  //   var supportingText = widget.description;
  //   var title = widget.person;

  //   return Card(
  //     color: Colors.white, //カードの四角
  //     elevation: 4.0,

  //     // elevation: 4.0,
  //     child: RepaintBoundary(
  //       key: previewContainer,
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.all(Radius.circular(15)),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             border: Border.all(
  //               width: 0,
  //             ),
  //           ),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 //Use of SizedBox
  //                 height: 10,
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(5),
  //                     topRight: Radius.circular(5)),
  //                 child: Container(
  //                   padding: EdgeInsets.fromLTRB(5, 1, 0, 0),
  //                   height: 32.0,
  //                   child: Row(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.center,
  //                         child: Text(title,
  //                             style: const TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 15,
  //                                 fontWeight: FontWeight.normal)),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 //Use of SizedBox
  //                 height: 8,
  //               ),
  //               ClipRRect(
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height * 0.4,
  //                   decoration: BoxDecoration(
  //                       color: Colors.grey.shade100,
  //                       image: DecorationImage(
  //                         image: Image.memory(base64Decode(widget.img_string))
  //                             .image,
  //                         fit: BoxFit.contain,
  //                       )),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 child: Container(
  //                   color: (widget.posNeg == "true")
  //                       ? Colors.red[300]
  //                       : Colors.blue.shade400,
  //                   height: 16.0,
  //                   child: Row(),
  //                 ),
  //               ),
  //               SizedBox(
  //                 //Use of SizedBox
  //                 height: 15,
  //               ),
  //               ClipRRect(
  //                 child: Container(
  //                   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
  //                   height: 30.0,
  //                   child: Stack(
  //                     children: <Widget>[
  //                       Positioned(
  //                           // left → right
  //                           right: 95,
  //                           child: Container(
  //                             child: showConditionPhysical(),
  //                           )),
  //                       Positioned(
  //                           right: 55,
  //                           child: Container(
  //                             child: showConditionCultural(),
  //                           )),
  //                       Positioned(
  //                           right: 15,
  //                           child: Container(
  //                             child: showConditionEmotional(),
  //                           )),
  //                       /*Positioned(
  //                         top: 7,
  //                         right: 15,
  //                         child: Container(
  //                             alignment: Alignment.center,
  //                             padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
  //                             child: Text.rich(
  //                               TextSpan(
  //                                 children: <InlineSpan>[
  //                                   WidgetSpan(
  //                                       alignment: ui.PlaceholderAlignment.top,
  //                                       child: Icon(
  //                                         Icons.location_on,
  //                                         color: Colors.grey,
  //                                         size: 15,
  //                                       )),
  //                                   TextSpan(text: widget.location),
  //                                 ],
  //                               ),
  //                               textAlign: TextAlign.center,
  //                               style: TextStyle(fontSize: 13),
  //                             )),
  //                       ),*/
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 child: Container(
  //                   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //                   width: MediaQuery.of(context).size.width * 0.8,
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(supportingText,
  //                       style: const TextStyle(
  //                         fontFamily: 'RobotoMono',
  //                         color: Colors.black,
  //                         fontSize: 13,
  //                       )),
  //                 ),
  //               ),
  //               SizedBox(
  //                 //Use of SizedBox
  //                 width: 34,
  //               ),
  //               Container(
  //                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //                 width: MediaQuery.of(context).size.width * 0.8,
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(formattedDate1,
  //                     style: const TextStyle(
  //                       fontFamily: 'RobotoMono',
  //                       color: Colors.black,
  //                       fontSize: 10,
  //                     )),
  //               ),
  //               Container(
  //                 height: 3.0,
  //                 child: Row(
  //                   children: [
  //                     Align(
  //                       alignment: Alignment.topRight,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  PostiveNegative() {
    if (widget.posNeg == "true") {
      return Icon(
        Icons.thumb_up_alt,
        color: Color(0xffff4b00),
        size: 80,
      );
    } else {
      return Icon(
        Icons.thumb_down_alt,
        color: Color(0xff005aff),
        size: 80,
      );
    }
  }

  showConditionPhysical() {
    if (widget.Phy == "true") {
      // return ImageIcon(
      //   AssetImage("assets/nokosubox.png"),
      //   color: Colors.blue[700],
      //   size: 24,
      // );
      return NeumorphicIcon(
        Icons.widgets,
        size: 26,
      );
    } else {
      // return ImageIcon(
      //   AssetImage("assets/nokosubox.png"),
      //   color: Colors.grey.shade300,
      //   size: 24,
      // );
      return Icon(
        Icons.widgets,
        color: Colors.grey.shade800,
        size: 26,
      );
    }
  }

  showConditionCultural() {
    if (widget.Cul == "true") {
      // return ImageIcon(
      //   AssetImage("assets/nokosuearth.png"),
      //   color: Colors.teal,
      //   size: 24,
      // );
      return NeumorphicIcon(
        Icons.public,
        size: 26,
      );
    } else {
      // return ImageIcon(
      //   AssetImage("assets/nokosuearth.png"),
      //   color: Colors.grey.shade300,
      //   size: 24,
      // );
      return Icon(
        Icons.public,
        color: Colors.grey.shade800,
        size: 26,
      );
    }
  }

  showConditionEmotional() {
    if (widget.Emo == "true") {
      // return ImageIcon(
      //   AssetImage("assets/nokosuheart.png"),
      //   color: Colors.red.shade300,
      //   size: 24,
      // );
      return NeumorphicIcon(
        Icons.favorite,
        size: 26,
      );
    } else {
      // return ImageIcon(
      //   AssetImage("assets/nokosuheart.png"),
      //   color: Colors.grey.shade300,
      //   size: 24,
      // );
      return Icon(
        Icons.favorite,
        color: Colors.grey.shade800,
        size: 26,
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

  void popupMenuSelected(Menu selectedMenu) {
    //引数selectedMenuをもつ
    switch (selectedMenu) {
      //条件分岐
      case Menu.download:
        // MaterialPageRoute(builder: (context) {
        //   return _captureSocialPng1;
        // }),
        widgetToImage();
        break;
      case Menu.home:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const Uploader();
          }),
        );
        break;
      default:
        break;
    }
  }
}
