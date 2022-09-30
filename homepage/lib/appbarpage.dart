// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Homescreen extends StatelessWidget {
//   // const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MainPag(),
//     );
//   }
// }

// class MainPag extends StatefulWidget {
//   const MainPag({super.key});

//   @override
//   State<MainPag> createState() => _MainPagState();
// }

// class _MainPagState extends State<MainPag> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: (MediaQuery.of(context).size.height),
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/sam.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 315),
//                   child: const Text(
//                     "depop",
//                     style: TextStyle(
//                         fontSize: 34,
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 330,
//                   child: SignInButton(
//                     Buttons.Google,
//                     text: "Sign up with Google",
//                     onPressed: () {},
//                   ),
//                 ),
//                 SizedBox(
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SignInButtonBuilder(
//                       width: 290,
//                       padding: EdgeInsets.only(left: 40),
//                       // margin
//                       text: 'Continue with Facebook',

//                       // icon: Icons.email,rgb(66,89,147)
//                       onPressed: () {},
//                       backgroundColor: Color.fromRGBO(66, 89, 147, 1)!,
//                     ),
//                   ],
//                 )),
//                 SizedBox(
//                     width: 330,
//                     child: SignInButtonBuilder(
//                       padding: EdgeInsets.only(left: 60),
//                       width: 210,
//                       text: 'Sign Up',

//                       // icon: Icons.email,
//                       onPressed: () {},
//                       backgroundColor: Color.fromARGB(255, 5, 5, 5),
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // ElevatedButton(
//                 //   child: Row(
//                 //     children: [
//                 //       Container(
//                 //           width: 30,
//                 //           height: 30,
//                 //           child: Image.asset("assets/images/search.png")),
//                 //       Text("Google")
//                 //     ],
//                 //   ),
//                 //   onPressed: () {},
//                 // ),
//                 // ElevatedButton.icon(onPressed: (){}, icon: icon.Assert( "assets/Google.png"), label:Text( "eff"))
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an Account?",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.white, fontFamily: 'RobotCondensed'),
//                       // style: GoogleFonts.poppins(
//                       //     textStyle: TextStyle(color: Colors.white),
//                       //     fontStyle: FontStyle.italic),

//                       // GoogleFonts.lato(fontStyle: FontStyle.italic)
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => secondpage()));
//                       },
//                       child: Text("Login",
//                           style: TextStyle(
//                             color: Colors.white,
//                             decoration: TextDecoration.underline,
//                           )),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 40, right: 40),
//                   child: Text(
//                     "By continuing Do you agree  our terms of services depopservices are subject to our privacy policy",
//                     textAlign: TextAlign.justify,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontFamily: 'Raleway',
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),

//           // child: Image.asset('assets/images/images.jpeg'),
//         ),
//       ),
//     );
//   }
// }


















































// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/container.dart';
// // import 'package:flutter/src/widgets/framework.dart';

// // class AppBarPage extends StatefulWidget {
// //   const AppBarPage({super.key});

// //   @override
// //   State<AppBarPage> createState() => _AppBarPageState();
// // }

// // class _AppBarPageState extends State<AppBarPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //           // bottom: TabBar(tabs: [
// //           //   Tab(
// //           //       text: 'Tab1',
// //           //       icon: Icon(
// //           //         Icons.add,
// //           //       )),
// //           //   Tab(
// //           //       text: 'Tab1',
// //           //       icon: Icon(
// //           //         Icons.add,
// //           //       )),
// //           //   Tab(text: 'Tab1', icon: Icon(Icons.add))
// //           // ]),
// //           ),
// //       body: Container(
// //         child: Text("hello Boys"),
// //       ),
// //     );
// //   }
// // // }
// // import 'package:flutter/material.dart';

// // void main(){
// //   runApp(MyApp());
// // }
// // List<String> countries = <String>['New York', 'India', 'USA', 'Norway'];
// // class MyApp extends StatefulWidget {
// //   //const MyApp({Key? key}) : super(key: key);

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   String dropdownValue = countries.first;
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 0,
// //         ),
// //         body: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             Row(
// //                mainAxisAlignment: MainAxisAlignment.start,
// //               children: const [
// //                 Padding(
// //                   padding: EdgeInsets.only(left: 5.0),
// //                   child: Text(
// //                     "Find events in",
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Padding(
// //                   padding: EdgeInsets.only(left: 10, bottom: 20),
// //                   child: Container(
// //                     width: 150,
// //                     child: DropdownButton<String>(
// //                       value: dropdownValue,
// //                       icon: Icon(Icons.keyboard_arrow_down),
// //                       elevation: 16,
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black,
// //                           fontSize: 25),
// //                       underline: Container(
// //                         height: 2,
// //                         color: Colors.black,
// //                       ),
// //                       onChanged: (String? value) {
// //                         // This is called when the user selects an item.
// //                         setState(() {
// //                           dropdownValue = value!;
// //                         });
// //                       },
// //                       items: countries
// //                           .map<DropdownMenuItem<String>>((String value) {
// //                         return DropdownMenuItem<String>(
// //                           value: value,
// //                           child: Text(value),
// //                         );
// //                       }).toList(),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: const [
// //                 Padding(
// //                   padding: EdgeInsets.all(10.0),
// //                   child: Text(
// //                     ("Popular in New York"),
// //                     style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //         bottomNavigationBar: BottomNavigationBar(
// //           items: const <BottomNavigationBarItem>[
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.home, color: Colors.black54),
// //               label: 'Home',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.search, color: Colors.black54),
// //               label: 'search',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.heart_broken_sharp, color: Colors.black54),
// //               label: 'favorite',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.smart_screen, color: Colors.black54),
// //               label: 'tag',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.account_circle_outlined, color: Colors.black54),
// //               label: 'account',
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
















