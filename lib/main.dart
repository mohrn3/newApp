import 'dart:io' as io;
import 'dart:async';
import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:newnokosuios/animated_screen.dart';
import 'package:newnokosuios/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/io_client.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// @dart=2.9

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    DriveApi.driveFileScope,
    DriveApi.driveAppdataScope,
  ],
);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: const AnimatedScreen()),
  ));
}

// // mapping Google Auth Credential to GoogleHttpClient Credentials
// class GoogleHttpClient extends IOClient {
//   Map<String, String> _headers;
//   GoogleHttpClient(this._headers) : super();
//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) =>
//       super.send(request..headers.addAll(_headers));
//   @override
//   Future<http.Response> head(Object url, {Map<String, String> headers}) =>
//       super.head(url, headers: headers..addAll(_headers));
// }

// ignore: must_be_immutable
class SplashPage extends StatefulWidget {
  int duration = 0;
  Widget goToPage;

  // final storage = new FlutterSecureStorage();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn =
  //     GoogleSignIn(scopes: ['https://www.googleapis.com/auth/drive.appdata']);
  // GoogleSignInAccount? googleSignInAccount;
  // ga.FileList? list;
  // var signedIn = false;

  SplashPage({Key? key, required this.goToPage, required this.duration})
      : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GoogleSignInAccount? _currentUser;

  @override
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: widget.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget.goToPage));
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: AnimatedSplashScreen(
          splash: const ImageIcon(
            AssetImage("assets/black_name.png"),
            size: 500.0,
          ),
          nextScreen: const AnimatedScreen(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 200.0,
          backgroundColor: Colors.transparent,
          duration: 1550,
        ),
      ),
    );
  }

  // google sign in
  Future<Null> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // upload file to Google drive
  Future uploadFile(DriveApi api, io.File file, String filename) {
    var media = Media(file.openRead(), file.lengthSync());
    return api.files
        .create(File.fromJson({"name": filename}), uploadMedia: media)
        .then((File f) {
      print('Uploaded $file. Id: ${f.id}');
    });
  }
}
