// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;
  bool _obscureText = true;
  bool _obscureTextC = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var scholar = "";
  var email = "";
  var password = "";
  var confirmpassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final scholarController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
//final clrController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    scholarController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    //amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      Future<void> addUser() async {
      CollectionReference milks = FirebaseFirestore.instance
          
          .collection('Students');

      return await milks.doc(email).set({
        'name': name,
        'scholar': scholar,
        'email': email,
    
      })
          //.then((value) => ScaffoldMessenger.of(context).showSnackBar(snackBar))
          // ignore: invalid_return_type_for_catch_error
          .catchError((error) {
        //print('Failed to Add user: $error');

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
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
            content: Text('Failed to Add user: $error'),
            actions: <Widget>[
              /* TextButton(
  
                onPressed: () => Navigator.pop(context, 'Cancel'),
  
                child: const Text('Cancel'),
  
              ),*/

              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }

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
                  stops: [
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
              // height: MediaQuery.of(context).size.height * 0.2,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Container(
                      child: Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Register",
                              style: GoogleFonts.federo(
                                  textStyle: TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      //fontStyle: FontStyle.italic,
                                      fontSize: 30,
                                      color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0217,
                          ),
                          Text(
                            "Please fill the details carefully:",
                            style: GoogleFonts.robotoCondensed(
                                textStyle: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white70)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.068,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                child: TextFormField(
                                  validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Full Name';
                                          }
                                          return null;
                                        },
                                        controller: nameController,
                                      
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(fontSize: 23),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0255,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      hintText: 'Full Name',
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
                                            MdiIcons.accountCircleOutline,
                                            size: 25,
                                            color: Colors.white70,
                                          )),
                                      border: InputBorder.none),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0203,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return 'Please Enter Scholar Number';
                                    }
                                    return null;
                                  },
                                controller: scholarController,
                        
                                  //  autofillHints: [AutofillHints.telephoneNumber],
                                  /* inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              new RegExp(r"['0123456789']"))
                                        ],
                                        */
                                  style: TextStyle(fontSize: 23),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0255,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      hintText: 'Scholar Number',
                                      hintStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white70,
                                      ),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 25),
                                          child: Icon(
                                            MdiIcons.idCard,
                                            size: 25,
                                            color: Colors.white70,
                                          )),
                                      border: InputBorder.none),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0203,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.contains('@') == false) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null;
                                        },
                                      
                                  keyboardType: TextInputType.emailAddress,
                                  //autofillHints: [AutofillHints.email],
                                 controller: emailController,
                                  style: TextStyle(fontSize: 23),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0255,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      hintText: 'Email ID',
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
                                    MediaQuery.of(context).size.height * 0.0203,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                            
                                   controller: passwordController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 7) {
                                            return 'Please enter a valid Password';
                                          }
                                          return null;
                                        },
                                        
                                  style: TextStyle(fontSize: 23),
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0255,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      hintText: 'Password',
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
                                            MdiIcons.lock,
                                            size: 25,
                                            color: Colors.white70,
                                          )),
                                    suffixIcon: GestureDetector(
                                              child: Icon(_obscureText
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onTap: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                            ),
                                          
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0203,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  //   autofillHints: [AutofillHints.password],
                                   controller: confirmpasswordController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 7 ||
                                              confirmpasswordController.text !=
                                                  passwordController.text) {
                                            return 'Password does not match';
                                          }
                                          return null;
                                        },
                                       obscureText: _obscureTextC, 
                                  style: TextStyle(fontSize: 23),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0255,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white70,
                                      ),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 25),
                                          child: Icon(
                                            MdiIcons.lockAlert,
                                            size: 25,
                                            color: Colors.white70,
                                          )),
                                       suffixIcon: GestureDetector(
                                              child: Icon(_obscureTextC
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onTap: () {
                                                setState(() {
                                                  _obscureTextC =
                                                      !_obscureTextC;
                                                });
                                              },
                                            ),
                                            
                                      border: InputBorder.none),

                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.062,
                              ),
                              Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.056,
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
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                setState(() {
                                                  name = nameController.text;
                                                  scholar = scholarController.text;
                                                  email = emailController.text;
                                                  password =
                                                      passwordController.text;
                                                });

                                                try {
                                                  var user = await authc
                                                      .createUserWithEmailAndPassword(
                                                          email: email
                                                              .toLowerCase()
                                                              .trim(),
                                                          password:
                                                              password.trim());

                                                  addUser();

                                                  FocusScope.of(context)
                                                      .unfocus();

                                                  setState(() {
                                                    _isLoading = true;
                                                  });

                                                  if (user.additionalUserInfo!
                                                          .isNewUser ==
                                                      true) {
                                                    Navigator.pushNamed(
                                                        context, "login");
                                                  }
                                                } catch (error) {
//print(error);
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
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
                                                          '${error.toString().substring(error.toString().indexOf(' ') + 1)}'),
                                                      actions: <Widget>[
                                                        /* TextButton(
  
                onPressed: () => Navigator.pop(context, 'Cancel'),
  
                child: const Text('Cancel'),
  
              ),*/

                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  'OK'),
                                                          child:
                                                              const Text('OK'),
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
                                            "REGISTER",
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
