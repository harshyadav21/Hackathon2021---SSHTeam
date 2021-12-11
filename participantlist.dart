import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_organise/enterparty.dart';
import 'package:event_organise/eventpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParticipationList extends StatefulWidget {
  final q; final p;
   ParticipationList({Key? key,required this.p,required this.q}) : super(key: key);

  @override
  _ParticipationListState createState() => _ParticipationListState();
}
class _ParticipationListState extends State<ParticipationList> {
  GlobalKey key=GlobalKey();
   var fs = FirebaseFirestore.instance;
   int ch=0;
  var authc = FirebaseAuth.instance;


  List<Container> y = [];
  Widget createcontainer() {
    // var x=Colors.blue;
    //  bool isSelected=false;
    return StreamBuilder<QuerySnapshot>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null)
        // ignore: prefer_const_constructors
        {  return Center(child: CircularProgressIndicator());}

        // print("See new mesage comes here");

        var msg = snapshot.data.docs ?? "null";

        y = [];
//List add1= [];
        for (var d in msg) {
          //  var x=Colors.blue;
  
          var partyname = d.data()['email'] ?? "default data";
        
            var msgWidget =

                Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              width: MediaQuery.of(context).size.width,
              child: Card(
                //color: x,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.black.withOpacity(0.7),
                elevation: 5,
                child: Container(
                  color: 
                    Colors.white,
          

                  width: MediaQuery.of(context).size.width,

                  //  1, //to change the size of the ListTile

                  //  height: 100,

                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
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
                                Expanded(
                                  child: Container(
                                    // width:
                                    //MediaQuery.of(context).size.width * 0.556,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                     
                                             
                                            Container(
                                            
                                              child: FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('Students').doc(partyname).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data['name']}");
        }
        return Text("Loading");
          }
    
                                              //msgname,

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
      stream:  FirebaseFirestore.instance.collection('Party').doc(widget.q).collection('events').doc(widget.p).collection('participants').snapshots(),
    );
  } //bodydata


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text("Participant List"),),
      body: SingleChildScrollView(
          child: Container(
            color: Colors.red.shade50,
            /* decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.red.shade50,
                  Colors.red.shade100,
                  Colors.red.shade200
                ],
                    stops: [
                  0.3,
                  0.5,
                  1
                ])),*/

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