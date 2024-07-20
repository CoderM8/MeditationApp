//https://codingwithdhrumil.com/2021/01/bottom-sheet-flutter-with-example.html
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
// class demopage extends StatefulWidget {
//   const demopage({Key? key}) : super(key: key);
//
//   @override
//   _demopageState createState() => _demopageState();
// }
//
// class _demopageState extends State<demopage> {
//
//   bool playing = false; // at the begining we are not playing any song
//   IconData playBtn = Icons.play_arrow; // the main state of the play button icon
//
//   //Now let's start by creating our music player
//   //first let's declare some object
//   late AudioPlayer _player;
//   late AudioCache cache;
//
//   Duration position = new Duration();
//   Duration musicLength = new Duration();
//
//   //we will create a custom slider
//
//   Widget slider() {
//     return Container(
//       width: 300.0,
//       child: Slider.adaptive(
//           activeColor: Colors.blue[800],
//           inactiveColor: Colors.grey[350],
//           value: position.inSeconds.toDouble(),
//           max: musicLength.inSeconds.toDouble(),
//           onChanged: (value) {
//             seekToSec(value.toInt());
//           }),
//     );
//   }
//
//   //let's create the seek function that will allow us to go to a certain position of the music
//   void seekToSec(int sec) {
//     Duration newPos = Duration(seconds: sec);
//     _player.seek(newPos);
//   }
//
//   //Now let's initialize our player
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _player = AudioPlayer();
//     cache = AudioCache(fixedPlayer: _player);
//
//     //now let's handle the audioplayer time
//
//     //this function will allow you to get the music duration
//     // _player.durationHandler = (d) {
//     //   setState(() {
//     //     musicLength = d;
//     //   });
//     // };
//
//     //this function will allow us to move the cursor of the slider while we are playing the song
//     // _player.positionHandler = (p) {
//     //   setState(() {
//     //     position = p;
//     //   });
//     // };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: (Text("data")),),
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.blue,
//                 Colors.blue,
//               ]),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: 48.0,
//           ),
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //Let's add some text title
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12.0),
//                   child: Text(
//                     "Music Beats",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 38.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.0),
//                   child: Text(
//                     "Listen to your favorite Music",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 //Let's add the music cover
//                 Center(
//                   child: Container(
//                     width: 280.0,
//                     height: 280.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         image: DecorationImage(
//                           image: AssetImage("assets/image.jpg"),
//                         )),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: 18.0,
//                 ),
//                 Center(
//                   child: Text(
//                     "Stargazer",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30.0),
//                         topRight: Radius.circular(30.0),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         //Let's start by adding the controller
//                         //let's add the time indicator text
//
//                         Container(
//                           width: 500.0,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "${position.inMinutes}:${position.inSeconds.remainder(60)}",
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                 ),
//                               ),
//                               slider(),
//                               Text(
//                                 "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               iconSize: 45.0,
//                               color: Colors.blue,
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.skip_previous,
//                               ),
//                             ),
//                             IconButton(
//                               iconSize: 62.0,
//                               color: Colors.blue[800],
//                               onPressed: () {
//                                 //here we will add the functionality of the play button
//                                 if (!playing) {
//                                   //now let's play the song
//                                   cache.play("Stargazer.mp3");
//                                   setState(() {
//                                     playBtn = Icons.pause;
//                                     playing = true;
//                                   });
//                                 } else {
//                                   _player.pause();
//                                   setState(() {
//                                     playBtn = Icons.play_arrow;
//                                     playing = false;
//                                   });
//                                 }
//                               },
//                               icon: Icon(
//                                 playBtn,
//                               ),
//                             ),
//                             IconButton(
//                               iconSize: 45.0,
//                               color: Colors.blue,
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.skip_next,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// /*
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
//
// class MyContactPage extends StatefulWidget {
//   MyContactPage({Key? key,}) : super(key: key);
//
//
//
//   @override
//   _MyContactPageState createState() => _MyContactPageState();
// }
//
// class _MyContactPageState extends State<MyContactPage> {
//   final _formKey = GlobalKey<FormState>();
//   User user = new User();
//
//   final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("fhvbfjiuhhni"),
//       ),
//       body: Center(
//           child: Form(
//               key: _formKey,
//               autovalidate: false,
//               child: new ListView(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
//                 children: <Widget>[
//                   Center(
//                       child: Text(
//                         "Create Contact",
//                         style: TextStyle(fontSize: 25, color: Colors.black54),
//                       )),
//                   TextFormField(
//                     decoration: const InputDecoration(
//                         icon: const Icon(Icons.person),
//                         hintText: 'Enter your name',
//                         labelText: 'Name'),
//                     inputFormatters: [new LengthLimitingTextInputFormatter(10)],
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       user.name = value!;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: const InputDecoration(
//                         icon: const Icon(Icons.email),
//                         hintText: 'Enter your email address',
//                         labelText: 'Email'),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (!emailRegex.hasMatch(value!)) {
//                         return 'Please enter valid email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       user.email = value!;
//                     },
//                   ),
//
//                   TextFormField(
//                     decoration: const InputDecoration(
//                         icon: const Icon(Icons.phone),
//                         hintText: 'Enter your phone number',
//                         labelText: 'Phone'),
//                     keyboardType: TextInputType.phone,
//                     inputFormatters: [
//                       new WhitelistingTextInputFormatter(
//                           new RegExp(r'^[0-9]*$')),
//                       new LengthLimitingTextInputFormatter(10)
//                     ],
//                     validator: (value) {
//                       if (!phoneRegex.hasMatch(value!)) {
//                         return 'Please enter valid phone number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       user.phoneNo = value!;
//                     },
//                   ),
//
//                   TextFormField(
//                     key: _passwordFieldKey,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.security),
//                       hintText: 'Select your password',
//                       labelText: 'Password',
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter password';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                         icon: const Icon(Icons.compare),
//                         hintText: 'Please re-enter password',
//                         labelText: 'Conform Password'),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Password is required';
//                       }
//                       if (value != _passwordFieldKey.currentState!.value) {
//                         return 'Password do not match';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       user.password = value!;
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 24.0),
//                     child: RaisedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           print("Process data");
//                           _formKey.currentState!.save();
//                           print('Name: ${user.name}');
//                           print('Email: ${user.email}');
//                           print('Phone No: ${user.phoneNo}');
//                           print('Password: ${user.password}');
//                         } else {
//                           print('Error');
//                         }
//                       },
//                       child: Text('Create'),
//                     ),
//                   )
//                 ],
//               ))),
//     );
//   }
//
//   final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
//   final RegExp emailRegex = new RegExp(
//       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
//
//
// }
//
// class User {
//   late String name;
//   late  String email;
//   late String phoneNo;
//   late String password;
// }
//
// */
// /*
// import 'package:flutter/material.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   bool showPassword = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.green,
//           ),
//           onPressed: () {},
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Text(
//                 "Edit Profile",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: Offset(0, 10))
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                 "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
//                               ))),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             width: 4,
//                             color: Theme.of(context).scaffoldBackgroundColor,
//                           ),
//                           color: Colors.green,
//                         ),
//                         child: Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             width: 4,
//                             color: Theme.of(context).scaffoldBackgroundColor,
//                           ),
//                           color: Colors.green,
//                         ),
//                         child: Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 35,
//               ),
//               buildTextField("Full Name", "Dor Alex", false),
//               buildTextField("E-mail", "alexd@gmail.com", false),
//               buildTextField("Password", "********", true),
//               buildTextField("Location", "TLV, Israel", false),
//               SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlineButton(
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text("CANCEL",
//                         style: TextStyle(
//                             fontSize: 14,
//                             letterSpacing: 2.2,
//                             color: Colors.black)),
//                   ),
//                   RaisedButton(
//                     onPressed: () {},
//                     color: Colors.green,
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Text(
//                       "SAVE",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 35.0),
//       child: TextField(
//         obscureText: isPasswordTextField ? showPassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     onPressed: () {
//                       setState(() {
//                         showPassword = !showPassword;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.grey,
//                     ),
//                   )
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 3),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             )),
//       ),
//     );
//   }
// }
// */
//
