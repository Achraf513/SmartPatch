import 'package:flutter/material.dart';
import 'package:smart_patch/ProfileScreen.dart';
import 'package:smart_patch/Responses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _period = "Weeks";
  bool connected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/profilePic.jpg'),
                            radius: 30),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Affes Achraf",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen())),
                                child: Text(
                                  "Show profile",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nicotine level changes described in ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      DropdownButton<String>(
                        value: _period,
                        items: <String>['Months', 'Weeks', 'Days']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _period = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 200,
                      color: Colors.white,
                      child: Center(
                          child: Image(
                        image:
                            AssetImage("assets/nicotineLvlOverThe$_period.jpg"),
                      ))),
                  SizedBox(height: 5,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.bluetooth_connected_outlined,
                            size: 35,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Linked Device",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(onPressed: (){
                            if (!connected){
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content: Container(
                                    height: 120,
                                    child: Column(
                                      children: [
                                        Text('Please enter the password displayed in the Smart Patch screen.'),
                                        SizedBox(height: 15,),
                                        Container(
                                           height: 45,
                                           child: TextFormField( 
                                            style: TextStyle(
                                              fontSize: 13, 
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black
                                            ),
                                            decoration: InputDecoration(
                                              labelText: "password",
                                              labelStyle: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              )), 
                                            ),
                                         ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.pop(context, 'Connect');
                                        setState(() {
                                          connected=true;
                                        });
                                      },
                                      child: const Text('Connect'),
                                    ),
                                  ],
                                ),
                              );
                            }else{
                              setState(() {
                                connected=false;
                              });
                            }
                          }, child: Text(connected?"Disconnect":"connect",
                            style: TextStyle(color: connected?Colors.green:Colors.red),
                          )) 
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.autorenew_rounded,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: connected?3:4,
                              child: Text(
                                "Device name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              )
                            ),
                            Expanded(
                              flex: connected?4:3,
                              child: Center(
                                child: Text(
                                  connected?"Smart Patch vg523s":"None",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ),
                          ],
                        ),
                      ), 
                      SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.battery_charging_full_sharp,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Current Batterie percentage",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              )
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  connected?"87 %":"Unkown",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ),
                          ],
                        ),
                      ), 
                      SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.bloodtype_rounded ,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Current tank percentage",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              )
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  connected?"93 %":"Unkown",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ),
                          ],
                        ),
                      ), 
                      SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.smoke_free_rounded,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Current Nicotine level",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              )
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  connected?"6mg":"Unkown",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ),
                          ],
                        ),
                      ), 
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(
                            Icons.message_rounded  ,
                            size: 35,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Consultation",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(onPressed: (){ 
                            
                          }, 
                          child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ResponsesScreen()));}, child: Text("Edit Responses"))) 
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 3, 0, 3),
                              child: Text(
                                "Say no to cigarettes!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                                ),
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
                                    "Keep it up! we are almost there, if you ever felt an urgent need to smoke or felt that you are somewhat restless and impatient make sure to retake the consultation and fill in with accurate data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  )
                                ),
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
                ])
              )
            )
          );
  }
}
