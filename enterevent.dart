import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterEvent extends StatefulWidget {
   final k;
const EnterEvent({required this.k, Key? key}) : super(key: key);

  @override
  _EnterEventState createState() => _EnterEventState();
}

class _EnterEventState extends State<EnterEvent> {
  final _formKey = GlobalKey<FormState>();
  var authc = FirebaseAuth.instance;
  var eventname = "";
  var eventmax="";
 var eventcode="";
  final eventnameController = TextEditingController();
  final eventmaxController=TextEditingController();
  final eventcodeController = TextEditingController();
 
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    eventnameController.dispose();
  eventmaxController.dispose();
  eventcodeController.dispose();
    super.dispose();
  }
clearText() {
    eventnameController.clear();
  eventmaxController.clear();
  eventcodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // authc.currentUser!.email!='hy1@gmail.com';

    CollectionReference milks =
        FirebaseFirestore.instance.collection('Party').doc('${widget.k}').collection('events');
    Future addUser() async {
      return await milks.doc(eventname).set(
        {
          
          'name': eventname,
          'max': eventmax,
          'eventhead': eventcode,
     
        },
SetOptions(merge: true)
      )
          //.then((value) => ScaffoldMessenger.of(context).showSnackBar(snackBar))
          // ignore: invalid_return_type_for_catch_error
          //.catchError((error) =>  print('Failed to Add user: $error'))
          ;
    }

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        //reverse: true,
        scrollDirection: Axis.vertical,

//shrinkWrap: true,
        //clipBehavior: Clip.antiAlias,
        child: Column(
          //mainAxisSize: MainAxisAlignment.start,
          children: [
            Container(
              // height: MediaQuery.of(context).size.height * 0.3,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.002,
                  0,
                  MediaQuery.of(context).size.width * 0.002,
                  MediaQuery.of(context).size.height * 0.04),
              //color: Colors.grey,
              //width: MediaQuery.of(context).size.width*0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Enter Details:',
                        style:  TextStyle(
                          //fontWeight: FontWeight.w500,

                          //fontStyle: FontStyle.italic,

                          fontSize: MediaQuery.of(context).size.height * 0.027,
                        )),
                      ),
                    
                    // SizedBox(height: 32),
                   
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical: 0),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: Colors.black45),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: eventnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical: 0),
                        labelText: 'Event Max Limit',
                        labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: Colors.black45),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: eventmaxController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Max Limit';
                        }
                        return null;
                      },
                    ),
                    
                             SizedBox(height: 20),
                    
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical: 0),
                        labelText: 'Event Head Name',
                        labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: Colors.black45),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: eventcodeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Event Head Name';
                        }
                        return null;
                      },
                    ),
                   
                                       ],
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); //to hide or close keyboard

                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      eventname = eventnameController.text;
                      eventmax=eventmaxController.text;
                      eventcode=eventcodeController.text;
                      addUser();
                      clearText();
                    });
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {clearText()},
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
