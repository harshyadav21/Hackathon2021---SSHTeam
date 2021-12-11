import 'package:event_organise/Login.dart';
import 'package:event_organise/eventpage.dart';
import 'package:event_organise/home.dart';
import 'package:event_organise/home2.dart';
import 'package:event_organise/participantlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    //MaterialApp(
      //debugShowCheckedModeBanner: false,
    MyApp(),
    //),
  );
}

// void main() {
//   runApp(MaterialApp(
//     home: MyEvent(),
//   ));
// }



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey key =GlobalKey();
  GlobalKey key2=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
               initialRoute: "/",
               routes: {
                 // ignore: prefer_const_constructors
                 "/": (context)=>  Login(),
                 "home2": (context)=>  Home2Page(),
                    "eventpage": (context)=> EventPage(key: key,p: ""),
                    "login": (contetx)=> Login(),
                    "participantlist": (context)=> ParticipationList(key: key2,p: "",q: "",),

               },
    );
  }
}
/*

class MyEvent extends StatefulWidget {
  const MyEvent({Key? key}) : super(key: key);


  @override
  _MyEventState createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> {
  @override
  Widget build(BuildContext context) {
    var eventno = 1;
    Widget event() {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Text("Event $eventno"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 500,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width / 35,
                      //right: MediaQuery.of(context).size.width / 20,
                      // top: MediaQuery.of(context).size.height / 50),
                      ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Enter Event Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width / 20,
                      //right: MediaQuery.of(context).size.width / 20,
                      // top: MediaQuery.of(context).size.height / 50),
                      ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Event Head Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 200,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 500,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width / 35,
                      //right: MediaQuery.of(context).size.width / 20,
                      // top: MediaQuery.of(context).size.height / 50),
                      ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Enter Event Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  // padding: EdgeInsets.only(
                  //     // left: MediaQuery.of(context).size.width / 20,
                  //     //right: MediaQuery.of(context).size.width / 20,
                  //     // top: MediaQuery.of(context).size.height / 50),
                  //     ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Max. no. of participants",
                      hintStyle: GoogleFonts.pattaya(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 25,
                // right: MediaQuery.of(context).size.width / 25,
                top: MediaQuery.of(context).size.height / 25),
            child: Text(
              "Create Party",
              style: GoogleFonts.pattaya(fontSize: 45),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Container(
            //color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 25,
                    right: MediaQuery.of(context).size.width / 25,
                    // top: MediaQuery.of(context).size.height / 50),
                  ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.white, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.contacts,
                        size: 20,
                        color: Colors.black,
                      ),
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Enter Party Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      event();
                    },
                    child: Text("Add Event"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          Container(
            child: Text(
              "Event Details",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Container(
            child: Text("Event ${eventno}"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 500,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width / 35,
                      //right: MediaQuery.of(context).size.width / 20,
                      // top: MediaQuery.of(context).size.height / 50),
                      ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Enter Event Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width / 20,
                      //right: MediaQuery.of(context).size.width / 20,
                      // top: MediaQuery.of(context).size.height / 50),
                      ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Event Head Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 200,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 500,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: EdgeInsets.only(
                      // left: MediaQuery.of(context).size.width / 35,
                      //right: MediaQuery.of(context).size.width / 20,
                      // top: MediaQuery.of(context).size.height / 50),
                      ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Enter Event Name",
                      hintStyle: GoogleFonts.pattaya(
                          color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  // padding: EdgeInsets.only(
                  //     // left: MediaQuery.of(context).size.width / 20,
                  //     //right: MediaQuery.of(context).size.width / 20,
                  //     // top: MediaQuery.of(context).size.height / 50),
                  //     ),
                  child: TextFormField(
                    style:
                        GoogleFonts.pattaya(color: Colors.black, fontSize: 15),
                    // controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.contacts,
                      //   size: 20,
                      //   color: Colors.black,
                      // ),
                      fillColor: Colors.yellow,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.amber.shade200,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Max. no. of participants",
                      hintStyle: GoogleFonts.pattaya(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  */

