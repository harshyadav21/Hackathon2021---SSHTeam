import 'package:event_organise/Registration_p.dart';
import 'package:event_organise/choosep.dart';
import 'package:event_organise/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var authc = FirebaseAuth.instance;

  var _email = "";

  var _password = "";
  bool _isLoading = false;

  bool _obscure = true;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  colors: [
                Colors.black,
                Colors.grey.shade900,
                Colors.blueGrey.shade900,
              ],
                  stops: const [
                0.3,
                0.6,
                0.9,
              ])),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey.shade900, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              'assets/images/party.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                reverse: true,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        /*decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.green),
                              ),*/
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Party ON",
                                  style: GoogleFonts.federo(
                                      textStyle: TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back,",
                                  style: GoogleFonts.fredokaOne(
                                    textStyle: TextStyle(
                                        //fontWeight: FontWeight.w500,
                                        //fontStyle: FontStyle.italic,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sign in to continue",
                                  style: GoogleFonts.robotoCondensed(
                                      textStyle: TextStyle(
                                          //fontWeight: FontWeight.w500,
                                          //fontStyle: FontStyle.italic,
                                          fontSize: 19,
                                          color: Colors.white70)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                // autofillHints: [AutofillHints.email],
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                validator: (value) {
                                  if (value!.contains('@') == false) {
                                    return "Please enter a valid email address";
                                  }

                                  return null;
                                },

                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.0255,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.0188),
                                    hintText: 'Email-ID',
                                    hintStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color: Colors.white70,
                                    ),
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0068,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.0636),
                                        child: Icon(
                                          MdiIcons.emailEditOutline,
                                          size: 25,
                                          color: Colors.white70,
                                        )),
                                    border: InputBorder.none),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.width * 0.0382,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                //  autofillHints: [AutofillHints.password],
                                textInputAction: TextInputAction.done,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value!.length < 7) {
                                    return "Please enter a valid password";
                                  }
                                  return null;
                                },

                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                obscureText: _obscure,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.0382,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.0188),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color: Colors.white70,
                                    ),
                                    suffixIcon: GestureDetector(
                                      child: Icon(_obscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onTap: () {
                                        setState(() {
                                          _obscure = !_obscure;
                                        });
                                      },
                                    ),
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0068,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.0636),
                                        child: Icon(
                                          MdiIcons.lock,
                                          size: 25,
                                          color: Colors.white70,
                                        )),
                                    border: InputBorder.none),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    horizontal:
                                        MediaQuery.of(context).size.height *
                                            0.008,
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    highlightColor: Colors.blueGrey.shade800,
                                    splashColor: Colors.white,
                                    onTap: () {},
                                    child: FittedBox(
                                      child: Text(
                                        "Forgot Password",
                                        style: GoogleFonts.robotoCondensed(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.023)),
                                        //style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.056,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent.shade700
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    highlightColor: Colors.deepOrange.shade800
                                        .withOpacity(0.5),
                                    splashColor: Colors.deepOrange.shade900,
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        setState(() {
                                          _email = _emailController.text;
                                          _password = _passwordController.text;
                                        });

                                        try {
                                          var user = await authc
                                              .signInWithEmailAndPassword(
                                                  email: _email.trim(),
                                                  password: _password.trim());
                                          FocusScope.of(context).unfocus();

                                          setState(() {
                                            _isLoading = true;
                                          });

                                          // Navigator.pushNamed(context, "choose");
                                          // ignore: unnecessary_null_comparison
                                          if (user != null) {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('email', _email);
                                            //   initram();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        // ignore: prefer_const_constructors
                                                        Choose()));
                                          }
                                        } catch (error) {
                                          //print(error);
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: Row(
                                                children: [
                                                  Icon(
                                                    Icons.warning,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text('Error Occured'),
                                                ],
                                              ),
                                              content: Text(
                                                  '${error.toString().substring(error.toString().indexOf(' '))}'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }

                                        // dispose();

                                      }
                                    },
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          "LOGIN",
                                          style: GoogleFonts.fredokaOne(
                                              textStyle: TextStyle(
                                                  color: Colors.white60),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.033),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(7)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistrationPage()));
                                },
                                child: FittedBox(
                                  child: Text(
                                    "New User? SignUp",
                                    style: GoogleFonts.signika(
                                        textStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.027,
                                            color: Colors.white)),
                                    //style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
