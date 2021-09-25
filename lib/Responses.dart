import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResponsesScreen extends StatefulWidget {
  const ResponsesScreen({Key? key}) : super(key: key);

  @override
  _ResponsesScreenState createState() => _ResponsesScreenState();
}

class _ResponsesScreenState extends State<ResponsesScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _description = "";
  String _priority = "";
  bool insomniaChecked= false;
  bool urgentNeedToSmokechecked= false;
  bool cantFocusChecked= false;
  bool checked= false;
  DateTime _deadLine = DateTime.now();
  final List<String> priorities = ["Between 1 and 5", "Between 6 and 10", "Between 11 and 15", "Between 16 and 20","More than 20"];
  final List<String> periods = ["Between 0 and 5 minutes","Between 6 and 15 minutes","Between 16 and 30 minutes","Between 31 and 60 minutes","More than 1 hour"];
  final List<String> consicutiveSmokes = ["Just 1 cigarette","2 to 3 cigarettes","4 to 6 cigarettes","More than 7 cigarettes"];
  final List<String> nicotineValues = ["0.4mg","0.5mg","0.6mg","0.7mg","0.8mg","0.9mg","1mg","1.1mg"];
  final List<String> inhaledLvl = ["1","2","3","4","5"];
  TextEditingController _dateController = TextEditingController();
  final DateFormat dateFormat = DateFormat("MMM dd, yyyy");


  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _deadLine,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (date != null && date != _deadLine) {
      setState(() {
        _deadLine = date;
      });
      _dateController.text = dateFormat.format(_deadLine);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: AssetImage('assets/profilePic.jpg'),
                        radius: 30),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Affes Achraf",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              
              Form(
                  key: _formKey,
                  child: Column(
                    children: [ 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 55,
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: priorities
                              .map((priority) => DropdownMenuItem(
                                    child: Text(
                                      priority,
                                      style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black
                                      )
                                    ),
                                    value: priority,
                                  ))
                              .toList(),
                            style: TextStyle(
                                fontSize: 13, 
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "How many cigarettes do you smoke a day ?",
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onSaved: (input) => _priority = input.toString(),
                            validator: (input) => input == null
                                ? "Please select a priority level"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 55,
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: periods
                              .map((priority) => DropdownMenuItem(
                                    child: Text(
                                      priority,
                                      style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black
                                      )
                                    ),
                                    value: priority,
                                  ))
                              .toList(),
                            style: TextStyle(
                                fontSize: 13, 
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "Time since waking up to use your first cigarette?",
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onSaved: (input) => _priority = input.toString(),
                            validator: (input) => input == null
                                ? "Please select a priority level"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 55,
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: nicotineValues
                              .map((priority) => DropdownMenuItem(
                                    child: Text(
                                      priority,
                                      style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black
                                      )
                                    ),
                                    value: priority,
                                  ))
                              .toList(),
                            style: TextStyle(
                                fontSize: 13, 
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "Consumed cigarettes nicotine value?",
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onSaved: (input) => _priority = input.toString(),
                            validator: (input) => input == null
                                ? "Please select a priority level"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 55,
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: inhaledLvl
                              .map((priority) => DropdownMenuItem(
                                    child: Text(
                                      priority,
                                      style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black
                                      )
                                    ),
                                    value: priority,
                                  ))
                              .toList(),
                            style: TextStyle(
                                fontSize: 13, 
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "Amount of smoke inhaled rated on 5?",
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onSaved: (input) => _priority = input.toString(),
                            validator: (input) => input == null
                                ? "Please select a priority level"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 55,
                          child: DropdownButtonFormField(
                            isDense: true,
                            items: consicutiveSmokes
                              .map((priority) => DropdownMenuItem(
                                    child: Text(
                                      priority,
                                      style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black
                                      )
                                    ),
                                    value: priority,
                                  ))
                              .toList(),
                            style: TextStyle(
                                fontSize: 13, 
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                labelText: "How many consicutive cigarettes do you usally smoke?",
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onSaved: (input) => _priority = input.toString(),
                            validator: (input) => input == null
                                ? "Please select a priority level"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      /* Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: TextFormField(
                          validator: (input) {
                            if (input != null) {
                              if (input.isNotEmpty) {
                                return null;
                              } else {
                                return "Please select a deadline";
                              }
                            }
                          },
                          readOnly: true,
                          onTap: _handleDatePicker,
                          controller: _dateController,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                              labelText: "Deadline",
                              labelStyle: TextStyle(fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ), */
                      ListTile(
                        title: Text("Insomnia",
                        style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600,),),
                        subtitle: Text(
                          "you find it hard to go to sleep, or you wake up several times during the night ?",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: Checkbox(value: insomniaChecked,onChanged:(value){
                          setState(() {
                            insomniaChecked =! insomniaChecked;
                          });
                        }
                        ),
                      ),
                      ListTile(
                        title: Text("Unable to focus",
                        style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600,),),
                        subtitle: Text(
                          "Difficulty thinking clearly, inability to make decisions or even being unable to remember things that occurred a short time ago.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: Checkbox(value: cantFocusChecked,onChanged:(value){
                          setState(() {
                            cantFocusChecked =! cantFocusChecked;
                          });
                        }
                        ),
                      ),
                      ListTile(
                        title: Text("Urgent need to smoke",
                        style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600,),),
                        subtitle: Text(
                          "Drinking a coffee, driving in the car, checking email, feeling bored, etc still triggers your auto pilot mode with the urge to smoke",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: Checkbox(value: urgentNeedToSmokechecked,onChanged:(value){
                          setState(() {
                            urgentNeedToSmokechecked =! urgentNeedToSmokechecked;
                          });
                        }
                        ),
                      ),
                      ListTile(
                        title: Text("Under stress",
                        style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600,),),
                        subtitle: Text(
                          "Becoming easily agitated, frustrated. Feeling overwhelmed, Having difficulty relaxing and quieting your mind.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: Checkbox(value: checked,onChanged:(value){
                          setState(() {
                            checked =! checked;
                          });
                        }
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: TextButton(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        ),
                      )
                    ],
                  ),
                )

            ],
          ),
        ),
      ),
    );
  }
}

