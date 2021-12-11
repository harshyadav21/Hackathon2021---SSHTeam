import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterParty extends StatefulWidget {
  @override
  _EnterPartyState createState() => _EnterPartyState();
}

class _EnterPartyState extends State<EnterParty> {
 List idall = [];
  final _formKey = GlobalKey<FormState>();
  var authc = FirebaseAuth.instance;
  var partyname = "";
  var eventcode="";
  var eventmax="";
  final partynameController = TextEditingController();
  final eventcodeController = TextEditingController();
 final eventmaxController=TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    partynameController.dispose();
    eventcodeController.dispose();
    eventmaxController.dispose();
    super.dispose();
  }

  clearText() {
    partynameController.clear();
  eventcodeController.clear();
  eventmaxController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // authc.currentUser!.email!='hy1@gmail.com';

    CollectionReference milks =
        FirebaseFirestore.instance.collection('Party');
    Future<void> addUser() async {
  await milks.doc(partyname).set(
        {
          
          'name': partyname,
          'Partyhead': eventmax,
                                              //msgname,

                      
                'eventcode': eventcode,
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
                      controller: partynameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
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
                        labelText: 'Party Head Name',
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
                          return 'Enter Party Head Name';
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
                        labelText: 'Event Code',
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
                          return 'Enter Event Code';
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
                      partyname = partynameController.text;
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
