import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPag(),
    );
  }
}

class MainPag extends StatefulWidget {
  const MainPag({super.key});

  @override
  State<MainPag> createState() => _MainPagState();
}

class _MainPagState extends State<MainPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: (MediaQuery.of(context).size.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sam.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 270),
                  child: const Text(
                    "Depop",
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 290,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButtonBuilder(
                      width: 270,
                      padding: EdgeInsets.only(left: 20),
                      text: 'Continue with Facebook',

                      // icon: Icons.email,rgb(66,89,147)
                      onPressed: () {},
                      backgroundColor: Color.fromRGBO(66, 89, 147, 1)!,
                    ),
                  ],
                )),
                SizedBox(
                    width: 290,
                    child: SignInButtonBuilder(
                      padding: EdgeInsets.only(left: 60),
                      width: 210,
                      text: 'Sign Up',

                      // icon: Icons.email,
                      onPressed: () {},
                      backgroundColor: Color.fromARGB(255, 5, 5, 5),
                    )),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   child: Row(
                //     children: [
                //       Container(
                //           width: 30,
                //           height: 30,
                //           child: Image.asset("assets/images/search.png")),
                //       Text("Google")
                //     ],
                //   ),
                //   onPressed: () {},
                // ),
                // ElevatedButton.icon(onPressed: (){}, icon: icon.Assert( "assets/Google.png"), label:Text( "eff"))
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    "By continuing Do you agree  our terms of services depopservices are subject to our privacy policy",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),

          // child: Image.asset('assets/images/images.jpeg'),
        ),
      ),
    );
  }
}
