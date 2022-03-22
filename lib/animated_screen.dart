import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:newnokosuios/image_picker.dart';
import 'package:provider/provider.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  LiquidController _liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // body: Builder(
        //   builder: (context) => LiquidSwipe(
        // body: LiquidSwipe(
        // pages: pages,
        body: LiquidSwipe(
          pages: [
            Container(
              color: Colors.white,
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: [Colors.white])),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    // height: 400,
                    // width: 300,

                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset('assets/comment.png'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Write a Comment",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    // style: GoogleFonts.itim(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Save your thoughts, impressions and emotions together with the photo to look back anytime.",
                      // style: GoogleFonts.itim(
                      //   fontSize: 18.0,
                      // ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 87.0,
                  ),
                  Container(
                    color: Colors.black,
                    // decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //         colors: [Colors.orange.shade400, Colors.blue])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => ImagePicker())),
                        },
                        child: Text('Skip'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: [Colors.green.shade400, Colors.blue.shade400])),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    // width: MediaQuery.of(context).size.width * 0.8,
                    // height: 400,
                    // width: 300,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset('assets/selection.png'),
                    // child: Image.asset('assets/3trans.png'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Select Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),

                    textAlign: TextAlign.center,
                    // style: GoogleFonts.itim(fontSize: 24.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Label your captures with icons to help you categorize                                      ",
                      // style: GoogleFonts.itim(fontSize: 18.0, color: Colors.white),
                      // textAlign: TextAlign.center
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 108.0,
                  ),
                  Container(
                    color: Colors.black,
                    // decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //         colors: [
                    //       Colors.green.shade400,
                    //       Colors.blue.shade400
                    //     ])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => ImagePicker())),
                        },
                        child: Text('Skip'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: [Colors.pink.shade400, Colors.deepPurple])),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    // height: 400,
                    // width: 300,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset('assets/card.png'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Resulting Look",
                    // style: GoogleFonts.itim(fontSize: 24.0),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Nokosu helps you capture the moments with ease ",
                      // style: GoogleFonts.itim(
                      //   fontSize: 18.0,
                      // ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 108.0,
                  ),
                  Container(
                    color: Colors.black,
                    // decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [Colors.pink.shade400, Colors.deepPurple])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => ImagePicker())),
                        },
                        child: Text('Skip'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
          liquidController: _liquidController,
          waveType: WaveType.liquidReveal,
          enableLoop: true,
          slideIconWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                children: [
                  TextSpan(
                    text: "Drag Left ",
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.arrow_left,
                      size: 45,
                      color: Colors.green[900],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
