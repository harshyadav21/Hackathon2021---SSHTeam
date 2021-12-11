import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_organise/enterparty.dart';
import 'package:event_organise/eventpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey key = GlobalKey();
  var fs = FirebaseFirestore.instance;
  int ch = 0;
  var authc = FirebaseAuth.instance;

  List<Container> y = [];
  Widget createcontainer() {
    // var x=Colors.blue;
    //  bool isSelected=false;
    return StreamBuilder<QuerySnapshot>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null)
        // ignore: prefer_const_constructors
        {
          return Center(child: CircularProgressIndicator());
        }

        // print("See new mesage comes here");

        var msg = snapshot.data.docs ?? "null";

        y = [];
//List add1= [];
        for (var d in msg) {
          //  var x=Colors.blue;

          var partyname = d.data()["name"] ?? "default data";
          var headname = d.data()["Partyhead"] ?? "default data";

          var msgWidget = Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            width: MediaQuery.of(context).size.width,
            child: Card(
              //color: x,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200),
              ),
              shadowColor: Colors.orange.shade900.withOpacity(0.6),
              elevation: 24,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    // stops: [0.0, 0.5, 0.5, 1],
                    colors: [
                      // Colors.amberAccent,
                      Colors.grey.shade600,
                      Colors.grey.shade600,
                      Colors.orange.shade900,
                      // Colors.grey.shade600,
                      Colors.grey.shade400,
                      Colors.grey.shade400,
                      Colors.grey.shade400,
                      Colors.grey.shade200,

                      Colors.grey.shade200,

                      Colors.grey.shade100,
                      Colors.grey.shade100,
                      // Colors.grey.shade600,

                      // Colors.black,
                      // Colors.grey,
                      // //  Colors.blue,
                      // //  Colors.grey,
                      // Colors.black,
                      // Colors.black,
                      // //  Colors.amberAccent,
                    ],
                    //  tileMode: TileMode.repeated,
                  ),
                ),

                width: MediaQuery.of(context).size.width,

                //  1, //to change the size of the ListTile

                //  height: 100,

                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(
                            key: key,
                            p: partyname,
                          ),
                        ));
                  },
                  minVerticalPadding: 15,
                  hoverColor: Colors.red.shade50,
                  title: SingleChildScrollView(
                    child: Container(
                      //  color: x,
                      // height: MediaQuery.of(context).size.height,

                      width: MediaQuery.of(context).size.width,

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/leader.png',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Expanded(
                                child: Container(
                                  // width:
                                  //MediaQuery.of(context).size.width * 0.556,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            //   // stops: [0.0, 0.5, 0.5, 1],
                                            //   colors: [
                                            //     Colors.black,
                                            //     Colors.black,
                                            //     Colors.grey,
                                            //     //  Colors.blue,
                                            //     Colors.grey,
                                            //     Colors.black,
                                            //     Colors.black,
                                            //   ],
                                            //   tileMode: TileMode.repeated,
                                            // ),
                                            ),
                                        child: Text(
                                          "Party Head:-" + " " + headname,
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.0217),
                                        ),
                                      ),

                                      //msgname,

                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 0,
                                          top: 10,
                                        ),
                                        // alignment: Alignment.topLeft,
                                        child: Text(
                                          "Party Name:- ${partyname}",

                                          //msgname,

                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.0217),
                                          //fontWeight: FontWeight.w500,

                                          //fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // SizedBox(
                              //  width: 0.0556,
                              // ),

                              //  alignment: Alignment.centerRight,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          y.add(msgWidget);
        }

        return Container(
          child: ListView(
            key: const PageStorageKey('c'),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            children: y,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        );
      },
      stream: fs.collection('Party').snapshots(),
    );
  } //bodydata

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                // title: const Text('AlertDialog Title'),

                content: EnterParty(),

                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text('CANCEL',
                        style: TextStyle(
                          //fontWeight: FontWeight.w500,

                          //fontStyle: FontStyle.italic,

                          fontSize: MediaQuery.of(context).size.height * 0.023,
                        )),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text('OK',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.023,
                        )),
                  ),
                ],
              ),
            );
          }),

      // ignore: prefer_const_constructors
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 7.5,
            ),
            Text(
              "Create Party",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
          height: MediaQuery.of(context).size.height,
          //color: Colors.red.shade50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.shade100,
                Colors.orange.shade200,
                Colors.orange.shade400
              ],
              stops: [0.3, 0.5, 1],
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                createcontainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
