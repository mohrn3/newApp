// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:newnokosuios/card.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Uploader extends StatefulWidget {
  const Uploader({Key? key}) : super(key: key);

  @override
  _Uploader createState() => _Uploader();
}

class _Uploader extends State<Uploader> {
  File? file;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  // late Address address;

  Map<String, double> currentLocation = {};
  TextEditingController personController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  bool uploading = false;

  @override
  Widget build(BuildContext context) => file == null
      ? Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(00, 50, 0, 40),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 0.0, top: 50.0, right: 0.0, bottom: 0.0),
                        width: 250,
                        height: 250,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/black_name.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(00, 0, 0, 0),
                        child: SizedBox(
                          width: 250.0,
                          height: 50,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                RotateAnimatedText(' Hello！'),
                                RotateAnimatedText('こんにちは！'),
                                RotateAnimatedText('여보! '),
                                RotateAnimatedText('你好！'),
                              ],
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(00, 0, 0, 0),
                        child: SizedBox(
                          width: 250.0,
                          height: 20,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12.0,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                // FadeAnimatedText('do IT!'),
                                // FadeAnimatedText('do it RIGHT!!'),
                                // FadeAnimatedText('do it RIGHT NOW!!!'),
                                // RotateAnimatedText('Hello!'),
                                RotateAnimatedText(
                                    'Welcome to CUTTIE Application.'),
                                RotateAnimatedText('CUTTIEアプリケーションへようこそ。'),
                                RotateAnimatedText('CUTTIE 앱에 오신 것을 환영합니다. '),
                                RotateAnimatedText('欢迎使用 CUTTIE 应用程序。'),
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(00, 107, 00, 20),

                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        color: Color(0xffffcabf),
                        height: 100,
                        // decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.bottomRight,
                        //         colors: [Colors.green, Colors.blue])),

                        child: IntrinsicHeight(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const ImageIcon(
                                          AssetImage('assets/cam.png'),
                                          // fit: BoxFit.contain,
                                          size: 500,
                                          color: Colors.white,
                                        ),

                                        color: Colors.white,
                                        hoverColor: Colors.green.shade600,
                                        alignment: Alignment.center,
                                        onPressed: () => getImage(
                                            source: ImageSource.camera),
                                        // child: const Text('Capture Image',
                                        //     style: TextStyle(fontSize: 18))
                                      ),
                                      const Text("Take a photo",
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  color: Colors.white,
                                  thickness: 0.7,
                                  endIndent: sqrt1_2,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: const ImageIcon(
                                          AssetImage('assets/gal.png'),
                                          size: 250,
                                          color: Colors.white,
                                        ),
                                        color: Colors.white,
                                        hoverColor: Colors.green.shade600,
                                        alignment: Alignment.center,
                                        onPressed: () => getImage(
                                            source: ImageSource.gallery),
                                        // child: const Text('Capture Image',
                                        //     style: TextStyle(fontSize: 18))
                                      ),
                                      const Text("Select from gallery",
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.white)),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ), //Container
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Container(
                        // margin: EdgeInsets.only(
                        //     left: 0.0, top: 60.0, right: 0.0, bottom: 0.0),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/fun.png',
                              fit: BoxFit.contain,
                              width: 50,
                              height: 25,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Powered by GlobalDesign@2022 Future University Hakodate, Japan",
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      ),

                      //Container
                    ),
                  ]),
            ),
          ),
        )
      : Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // backgroundColor: Colors.white70,
            flexibleSpace: Container(color: Colors.grey.shade900
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //         begin: Alignment.topLeft,
                //         end: Alignment.bottomRight,
                //         colors: [Colors.green, Colors.blue])),
                ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: clearImage),
            title: const Text(
              'Post to',
              style: const TextStyle(color: Colors.white),
            ),

            actions: <Widget>[
              Container(),
            ],
          ),
          body: ListView(
            children: <Widget>[
              PostForm(
                imageFile: file,
                personController: personController,
                descriptionController: descriptionController,
                locationController: locationController,
                loading: uploading,
              ),
              // Divider(), //scroll view where we will show location to users
              // (address == null)
              //     ? Container()
              //     : SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         padding: EdgeInsets.only(right: 5.0, left: 5.0),
              //         child: Row(
              //           children: <Widget>[
              //             buildLocationButton(address.featureName),
              //             buildLocationButton(address.subLocality),
              //             buildLocationButton(address.locality),
              //             buildLocationButton(address.subAdminArea),
              //             buildLocationButton(address.adminArea),
              //             buildLocationButton(address.countryName),
              //           ],
              //         ),
              //       ),
              // // ignore: unnecessary_null_comparison
              // (address == null) ? Container() : Divider(),

              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: ElevatedButton(
                    child: Text("Next".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //     RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.zero,
                      //         side: BorderSide(color: Colors.green)))
                    ),
                    // onPressed: () => ShowDialog(context),

                    onPressed: () => ShowDialogKJ(context),
                  )),
                  SizedBox(
                    //Use of SizedBox
                    width: 15,
                  ),
                  // Container(
                  //     child: ElevatedButton(
                  //   child: Text("KJ 法".toUpperCase(),
                  //       style: TextStyle(fontSize: 12)),
                  //   style: ButtonStyle(
                  //     foregroundColor:
                  //         MaterialStateProperty.all<Color>(Colors.white),
                  //     backgroundColor:
                  //         MaterialStateProperty.all<Color>(Colors.black),
                  //     // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //     //     RoundedRectangleBorder(
                  //     //         borderRadius: BorderRadius.zero,
                  //     //         side: BorderSide(color: Colors.green)))
                  //   ),
                  //   onPressed: () => ShowDialogKJ(context),
                  // )
                  // )
                ],
              ),
            ],
          ));

  void getImage({required ImageSource source}) async {
    PickedFile? imageFile = await ImagePicker().getImage(
        source: source, maxWidth: 1920, maxHeight: 1200, imageQuality: 80);

    if (imageFile?.path != null) {
      setState(() {
        file = File(imageFile!.path);
      });
    }
  }

  ShowDialogKJ(BuildContext parentContext) async {
    var myindex = 0;

    bool toggle = false;
    bool Position = true;
    bool Emotional = true;
    bool Physical = true;
    bool Cultural = true;

    return showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (_, __, ___) {
        String text1;
        String text2;
        String text3;

        return Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: 300,
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        //Use of SizedBox
                        height: 30,
                      ),
                      LiteRollingSwitch(
                        value: true,
                        textOn: 'Positive',
                        textOff: 'Negative',
                        colorOn: Colors.red[300],
                        colorOff: Colors.blue.shade400,
                        iconOn: Icons.thumb_up_sharp,
                        iconOff: Icons.thumb_down,
                        textSize: 8,
                        onChanged: (bool postiion) {
                          Position = postiion;
                          print("the button is $postiion ");
                        },
                      ),
                      const SizedBox(
                        //Use of SizedBox
                        height: 20,
                      ),
                      const Text(
                        "Select appropriate categories.",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        //Use of SizedBox
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LiteRollingSwitch(
                            value: true,
                            textOn: 'Emotional',
                            textOff: 'Not-Selected',
                            colorOn: Colors.red.shade300,
                            colorOff: Colors.grey,
                            iconOn: Icons.favorite_border_rounded,
                            iconOff: Icons.favorite_border_rounded,
                            textSize: 8,
                            onChanged: (bool emotional) {
                              Emotional = emotional;
                              print(
                                  "the pressAttentionEmotional is $emotional ");
                            },
                          ),
                          const SizedBox(
                            //Use of SizedBox
                            width: 5,
                          ),
                          LiteRollingSwitch(
                            value: true,
                            textOn: 'Physical',
                            textOff: 'Not-Selected',
                            colorOn: Colors.blue[700],
                            colorOff: Colors.grey,
                            iconOn: Icons.check_box_outline_blank_outlined,
                            iconOff: Icons.check_box_outline_blank_outlined,
                            textSize: 8,
                            onChanged: (bool physical) {
                              Physical = physical;
                              print("the pressAttentionPhysical is $physical ");
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        //Use of SizedBox
                        height: 5,
                      ),
                      LiteRollingSwitch(
                        value: true,
                        textOn: 'Cultural',
                        textOff: 'Not-Selected',
                        colorOn: Colors.teal,
                        colorOff: Colors.grey,
                        iconOn: Icons.circle_outlined,
                        iconOff: Icons.circle_outlined,
                        textSize: 8,
                        onChanged: (bool cultural) {
                          Cultural = cultural;
                          print("the pressAttentionCultural is $cultural ");
                        },
                      ),
                      const SizedBox(
                        //Use of SizedBox
                        height: 30,
                      ),
                      RoundedLoadingButton(
                        child: const Text('Done',
                            style: TextStyle(color: Colors.white)),
                        controller: _btnController,
                        onPressed: () => _doSomethingkj(
                            Cultural, Physical, Emotional, Position),
                      ),
                      const SizedBox(
                        //Use of SizedBox
                        height: 30,
                      ),
                    ],
                  ),
                ),
                margin: const EdgeInsets.only(
                    top: 50, bottom: 50, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  void _doSomethingkj(bool pressAttentionCultural, bool pressAttentionPhysical,
      bool pressAttentionEmotional, bool boolVal) async {
    String base64String = base64Encode(file!.readAsBytesSync());

    Timer(const Duration(seconds: 3), () {
      _btnController.success();
    });

    final String imgString = base64String;
    final String description = descriptionController.text;
    final String person = personController.text;
    final String location = locationController.text;
    // final String text3 = text;
    final String boolValue = boolVal.toString();
    final String boolPhy = pressAttentionPhysical.toString();
    final String boolEmo = pressAttentionEmotional.toString();
    final String boolCul = pressAttentionCultural.toString();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CardDesign(
                img_string: imgString,
                person: person,
                description: description,
                // location: location,
                Phy: boolPhy,
                Emo: boolEmo,
                Cul: boolCul,
                posNeg: boolValue,
              )),
    );
  }

  void clearImage() {
    setState(() {
      file = null;
    });
  }
}

class PostForm extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  // final imageFile;
  final imageFile;
  final TextEditingController personController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final bool loading;
  // ignore: use_key_in_widget_constructors
  const PostForm(
      {this.imageFile,
      required this.personController,
      required this.descriptionController,
      required this.loading,
      required this.locationController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        loading
            ? const LinearProgressIndicator()
            : const Padding(padding: EdgeInsets.only(top: 0.0)),
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(00, 30, 0, 10),
          child: Container(
            // height: 10,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
              // fit: BoxFit.fill,
              alignment: FractionalOffset.center,
              image: FileImage(imageFile),
            )),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 4, color: Color(0xffffcabf)), //ピンク色の枠
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const Icon(Icons.title_rounded),
            title: SizedBox(
              width: 250.0,
              child: TextField(
                controller: personController,
                decoration: const InputDecoration(
                    hintText: "Title", border: InputBorder.none),
              ),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 4, color: Color(0xffffcabf)), //ピンク色の枠
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const Icon(Icons.comment_bank), //コメントのアイコン
            title: SizedBox(
              width: 250.0,
              child: TextField(
                controller: descriptionController, //"コメント"の入力
                decoration: const InputDecoration(
                    hintText: "Write a comment", border: InputBorder.none),
              ),
            ),
          ),
        ),
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // children: <Widget>[
        //   // CircleAvatar(
        //   //   backgroundImage:
        //   //       Image.network(model.userDetails!.photoURL ?? "").image,
        //   //   radius: 20,
        //   // ),
        //   SizedBox(
        //     width: 250.0,
        //     child: TextField(
        //       controller: descriptionController,
        //       decoration: const InputDecoration(
        //           hintText: "Write a comment...", border: InputBorder.none),
        //       ),
        //     ),
        //   ],
        // ),
        //const Divider(),
        // ListTile(
        //   leading: const Icon(Icons.pin_drop),
        //   title: SizedBox(
        //     width: 250.0,
        //     child: TextField(
        //       controller: locationController,
        //       decoration: const InputDecoration(
        //           hintText: "Where was this photo taken?",
        //           border: InputBorder.none),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
