// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:prototype/auth/AuthMessages.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:prototype/auth/SignUp.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';

// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }

// class FaceRecognization extends StatefulWidget {
//   @override
//   _FaceRecognizationState createState() => _FaceRecognizationState();
// }

// class _FaceRecognizationState extends State<FaceRecognization> {
//   Color backgroundColor = Colors.purple[900];

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   TextEditingController usernameController = TextEditingController();

//   final LocalAuthentication auth = LocalAuthentication();

//   bool _canCheckBiometrics;
//   _SupportState _supportState = _SupportState.unknown;
//   List<BiometricType> _availableBiometrics;
//   String _authorized = 'Not Authorized';
//   bool _isAuthenticating = false;

//   @override
//   void initState() {
//     super.initState();
//     auth.isDeviceSupported().then(
//           (isSupported) => setState(() => _supportState = isSupported
//               ? _SupportState.supported
//               : _SupportState.unsupported),
//         );

//     if (_supportState == _SupportState.supported) {
//       _getAvailableBiometrics();
//       _checkBiometrics();
//     }
//   }

//   ///////////////////////////////
//   Future<void> _checkBiometrics() async {
//     bool canCheckBiometrics;
//     try {
//       canCheckBiometrics = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       canCheckBiometrics = false;
//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _canCheckBiometrics = canCheckBiometrics;
//     });
//   }

//   Future<void> _getAvailableBiometrics() async {
//     List<BiometricType> availableBiometrics;
//     try {
//       availableBiometrics = await auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       availableBiometrics = <BiometricType>[];

//       print(e);
//     }
//     if (!mounted) return;

//     setState(() {
//       _availableBiometrics = availableBiometrics;
//     });
//     print(_availableBiometrics);
//   }

//   // Future<void> _authenticate() async {
//   //   bool authenticated = false;
//   //   try {
//   //     setState(() {
//   //       _isAuthenticating = true;
//   //       _authorized = 'Authenticating';
//   //     });
//   //     authenticated = await auth.authenticate(
//   //         localizedReason: 'Authenticate your self ',
//   //         useErrorDialogs: true,
//   //         stickyAuth: true);
//   //     setState(() {
//   //       _isAuthenticating = false;
//   //       _authorized = 'Authenticating';
//   //     });
//   //   } on PlatformException catch (e) {
//   //     print(e);
//   //     setState(() {
//   //       _isAuthenticating = false;
//   //       _authorized = "Error - ${e.message}";
//   //     });
//   //     return;
//   //   }
//   //   if (!mounted) return;

//   //   setState(
//   //       () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
//   // }

//   Future<void> _authenticateWithBiometrics() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await auth.authenticate(
//           localizedReason: 'Scan your fingerprint or face to authenticate',
//           useErrorDialogs: true,
//           stickyAuth: true,
//           biometricOnly: true);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Authenticating';
//       });
//     } on PlatformException catch (e) {
//       print(e);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = "Error - ${e.message}";
//       });
//       return;
//     }
//     if (!mounted) return;

//     final String message = authenticated ? 'Authorized' : 'Not Authorized';
//     setState(() {
//       _authorized = message;
//     });
//     print(_authorized);
//   }

//   void _cancelAuthentication() async {
//     await auth.stopAuthentication();
//     setState(() => _isAuthenticating = false);
//   }
// ////////////////////////////

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     double mainAxisHeight = height > width ? height : width;

//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         title: Text('Marquina App'),
//         actions: [
//           Center(
//             child: Text(
//               'junedr375',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Container(
//         height: mainAxisHeight,
//         width: width,
//         padding: EdgeInsets.symmetric(horizontal: 40),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               SizedBox(height: mainAxisHeight * 0.10),
//               Center(
//                   child: Text('Marquina',
//                       style: TextStyle(fontSize: 25, color: Colors.white))),
//               SizedBox(height: 5),
//               Center(
//                   child: Text('Choose Image',
//                       style: TextStyle(fontSize: 25, color: Colors.white))),
//               SizedBox(height: mainAxisHeight * 0.04),
//               Container(
//                 height: 150,
//                 width: 150,
//                 child: InkWell(
//                   onTap: () {
//                     _authenticateWithBiometrics();
//                   },
//                   child: Container(
//                       height: 80,
//                       width: 120,
//                       alignment: Alignment.center,
//                       child: Icon(
//                         Icons.add_a_photo_outlined,
//                         size: 80,
//                         color: Colors.white,
//                       )),
//                 ),
//               ),
//               SizedBox(height: mainAxisHeight * 0.1),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.only(left: 10),
//                 child: InkWell(
//                     onTap: () {
//                       print('Sign UP');
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: ((context) => SignUpPage())));
//                     },
//                     child: Text(
//                       'Please Provide email Id',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500),
//                     )),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 50,
//                 width: width,
//                 padding: EdgeInsets.only(left: 20),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(25)),
//                 child: TextFormField(
//                   controller: usernameController,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Username',
//                       hintStyle: TextStyle(fontSize: 20)),
//                   style: TextStyle(color: Colors.black, fontSize: 22),
//                 ),
//               ),
//               SizedBox(height: 20),
//               SizedBox(height: 30),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: ((context) => AuthMessagesScreen(
//                               message1: "Thank you for sign-up",
//                               message2: "Confirmation mail will",
//                               message3: "be sent to your mail",
//                               message4: "Thank you !!"))));
//                 },
//                 child: Container(
//                   height: 50,
//                   width: width,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: Colors.white, width: 2)),
//                   child: Text(
//                     'Next',
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
