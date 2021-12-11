import 'package:event_organise/home.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey.shade500, Colors.white],
                stops: [0.2, 0.7]),
          ),
        ),
        Positioned(
          bottom: -50,
          left: 0,
          child: Container(
            color: Colors.transparent,
            //height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Colors.transparent],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/images/dab.png',
                // height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: Text(
                      "Party ON",
                      style: GoogleFonts.federo(
                          textStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              //fontStyle: FontStyle.italic,
                              fontSize: 50,
                              color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "What's on your mind?",
                          style: GoogleFonts.bitter(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blueGrey.shade700)),
                          //style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              color: Colors.blueGrey.shade900.withOpacity(0.4),
                            ),

                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              highlightColor: Colors.blueGrey.withOpacity(0.5),
                              splashColor: Colors.blueGrey.shade50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.pin,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Host",
                                    style: GoogleFonts.fredokaOne(
                                        textStyle: TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      //fontStyle: FontStyle.italic,
                                      fontSize: 25,
                                    )),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                                //Navigator.pushNamed(context, "customer");
                              },
                            ),

                            //  width: 150, //color: Colors.purple,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            // Customer Button.
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              color: Colors.blueGrey.shade900.withOpacity(0.4),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              highlightColor: Colors.blueGrey.withOpacity(0.5),
                              splashColor: Colors.blueGrey.shade50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.plusCircle,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Join",
                                    style: GoogleFonts.fredokaOne(
                                        textStyle: TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      //fontStyle: FontStyle.italic,
                                      fontSize: 25,
                                    )),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "home2");
                              },
                            ),

                            //color: Colors.purple,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
