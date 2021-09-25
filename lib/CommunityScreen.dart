import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  Widget _buildComment(String pic, String name, String comment, int index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index % 2 == 0 ? Colors.grey[800] : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.zero,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child:
                    CircleAvatar(backgroundImage: AssetImage(pic), radius: 40),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 0, 3),
                      child: Text(
                        "@" + name,
                        style: TextStyle(
                            color: index % 2 == 0 ? Colors.white : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            flex: 7,
                            child: Text(
                              comment,
                              style: TextStyle(
                                  color: index % 2 == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Positioned(
                        left: 10,
                        child: CircleAvatar(backgroundImage: AssetImage("assets/profilePic.jpg"), radius: 25), 
                      ),
                      Positioned(
                        right: 15,
                        child: Container(
                          width: 250,
                          child: TextField(
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              hintText:
                                  'Want to say something about your own experience ?',
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                          ),
                        ),
                      ),
                      Positioned(
                          right: 20,
                          bottom: 10,
                          child: Icon(
                            Icons.send,
                          ))
                    ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildComment(
                      'assets/aymen.jpg',
                      "Ayman Bouhamed",
                      "I can not get any cigarettes and as a substitute this is the best I have used way better than gum it is as close to the real thing as I have found.",
                      1),
                  _buildComment(
                      'assets/firas.jpg',
                      "Firas Hamouda",
                      "It is been 6 months without smoking. It helps to have something to go to when you crave smoking.",
                      2),
                  _buildComment(
                      'assets/melek.jpg',
                      "Melek Chaari",
                      "Let me first say that I really enjoyed smoking! I smoked a pack a day from the time I was 14 yrs old to age 25. Never thought I could or would EVER stop smoking. Until I experienced cramping in my right arm, felt like a constant charlie horse. Decided I did not want to have a stroke at age 25. It only took about 2 1/2 months to never want to light up again. Using this Smart Patch....I did it! So wonderful not to be controlled by an addiction!",
                      3),
                  _buildComment(
                      'assets/yosri.jpg',
                      "Yosri Miladi",
                      "I can not get any cigarettes and as a substitute this is the best I have used way better than gum it is as close to the real thing as I have found.",
                      4),
                  _buildComment(
                      'assets/akram.jpg',
                      "Akram Affes",
                      "Smoked cigs for 10 yrs and cigars for past 5 yrs. Until 2 months ago. Had tried to quit many times. My issue was breaking the habit. Last 2 month's several things have changed: I don't smell like smoke, I don't need to go outside to smoke, my smell and taste have returned. Saving money too.",
                      5),
                  _buildComment(
                      'assets/emna.jpg',
                      "Emna Kallel",
                      "I was a smoker for about 8 months smoking as much as 6 cigarettes a day. Although there is no magic when it comes to quitting this product helped a great deal.",
                      6),
                ]
              )
            )
          )
        );
  }
}
