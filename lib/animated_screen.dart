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
    body :style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                          );
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
                    height: 30.0,
                  ),
                  Container(
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
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Save your thoughts, impressions and emotions together with the photo to look back anytime.",
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
                  Container(//レイアウトボックス
                    // color: Colors.black,

                    
                   
                    child: Padding(
                      
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                     
                                          
                        child:ElevatedButton(
                        child: const Text('SKIP'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => Uploader())),
                        },
                            
                        // child: Text('Skip'), 
),
                      //  FlatButton(
                           
                      //   textColor: Colors.white,
                          
                          

                    
                      //   onPressed: () => {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context1) => Uploader())),
                      //   },
                            
                      //   child: Text('Skip'), 
                        

                        
                      // ),
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
                    height: 30.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    //child: Image.asset('assets/card.png'),
                    child: Image.asset('assets/selection.png'),
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
                    color: Colors.black,
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                       
                            
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => Uploader())),
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
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset('assets/card.png'),
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
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => Uploader())),
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
                      Icons.arrow_back_ios_new,
                      size: 35,
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
