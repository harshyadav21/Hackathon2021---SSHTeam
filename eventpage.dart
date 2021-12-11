import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_organise/enterevent.dart';
import 'package:event_organise/participantlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final p;
  const EventPage({required this.p, Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  GlobalKey key1 = GlobalKey();
  var fs = FirebaseFirestore.instance;
  int ch = 0;
  var authc = FirebaseAuth.instance;

  GlobalKey key2 = GlobalKey();

  /* List msg = [
    {'id': "1", 'name': "Sudeep Gupta", "phone": "222"},
    {'id': "2", 'name': "harsh", "phone": "2227897897"},
    {'id': "3", 'name': "bunty", "phone": "222"},
    {'id': "4", 'name': "Shivam", "phone": "222"},
    {'id': "5", 'name': "guruji", "phone": "222"}
  ];*/
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

          var eventmax = d.data()["max"] ?? "default data";

          var eventhead = d.data()["eventhead"] ?? "default data";

          var msgWidget = Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            width: MediaQuery.of(context).size.width,
            child: Card(
              //color: x,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
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
                      Colors.grey.shade100,
                      Colors.grey.shade100,
                      Colors.grey.shade200,

                      Colors.grey.shade200,
                      Colors.orange.shade900,
                      Colors.grey.shade400,
                      Colors.grey.shade400,
                      Colors.grey.shade400,
                      Colors.grey.shade600,
                      Colors.grey.shade600,

                      // Colors.grey.shade600,

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
                      borderRadius: BorderRadius.circular(15.0)),
                  onLongPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParticipationList(
                            key: key2,
                            p: partyname,
                            q: widget.p,
                          ),
                        ));
                  },
                  /*       
                    onTap: () {
                                   showDialog<String>(
                    context: context,

                    builder: (BuildContext context) => AlertDialog(
                      // title: const Text('AlertDialog Title'),

                      content: Text('Are You Sure You Want To Take PArt In It'),

                     actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(
                            'CANCEL',
                            style:  TextStyle(
                              //fontWeight: FontWeight.w500,

                              //fontStyle: FontStyle.italic,

                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                            )),
                          ),
                        
                        TextButton(
                          onPressed: () {
                             FirebaseFirestore.instance.collection('Party').doc(widget.p).collection('events').doc(partyname).collection('participants').doc(authc.currentUser!
                          .email).set({
                          
                          'email': authc.currentUser!.email,
                          });


                      
                        
                            
                             Navigator.pop(context, 'OK');},
                          child: Text(
                            'OK',
                            style: TextStyle(

                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                            )),
                          ),
                      
                      ],

                      
                    ),

        
                  )
;

},
           */
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
                              CircleAvatar(
                                radius: 20,
                                child: Image(
                                  image: AssetImage('assets/images/glass.PNG'),
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
                                        padding: EdgeInsets.only(
                                          left: 0,
                                          top: 10,
                                        ),
                                        // alignment: Alignment.topLeft,
                                        child: Text(
                                          "Event Name:- ${partyname}",

                                          //msgname,

                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.0217),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(),
                                        // alignment: Alignment.topLeft,
                                        child: Text(
                                          "Maximum Limit:- ${eventmax}",

                                          //msgname,

                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.0217),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                      ),
                                      Container(
                                        child: Text(
                                          "Event Head ${eventhead}",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.0217),
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
      stream: fs
          .collection('Party')
          .doc('${widget.p}')
          .collection('events')
          .snapshots(),
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

                content: EnterEvent(k: widget.p, key: key1),

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
              width: MediaQuery.of(context).size.width / 6,
            ),
            Text(
              "Event List",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 24,
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
