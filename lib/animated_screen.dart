import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:newnokosuios/image_picker.dart';
import 'package:provider/provider.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  final LiquidController _liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LiquidSwipe(
          pages: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Image.asset('assets/c_comment.jpg'),
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
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      "Save your thoughts, impressions and emotions together with the photo to look back anytime",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 92.0,
                  ),
                  Container(
                    //color: Colors.black,
                    // child: Padding(
                    //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: const Text('SKIP'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffff8082),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => Uploader())),
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Image.asset('assets/c_selection.jpg'),
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
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Label your captures with icons to help you categorize                                      ",
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
                    //color: Colors.black,
                    // child: Padding(
                    //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: const Text('SKIP'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffff8082),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            //ボックスの形
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => Uploader())),
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Image.asset('assets/c_card.jpg'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Resulting Look",
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
                      "Nokosu helps you capture the moments with ease                                             ",
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
                    //color: Colors.black,
                    // child: Padding(
                    //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: const Text('SKIP'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffff8082),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            //ボックスの形
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => Uploader())),
                        },
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
            padding: const EdgeInsets.all(16.0),
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
                      Icons.arrow_back,
                      size: 35,
                      color: Color(0xffff8082),
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
