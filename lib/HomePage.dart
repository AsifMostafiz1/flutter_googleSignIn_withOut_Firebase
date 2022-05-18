import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signinwithout_firebase/login_page.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
   GoogleSignInAccount user;
   HomePage({Key? key,required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.user.photoUrl.toString()),
          ),

          Text(widget.user.email),
          Text(widget.user.displayName.toString()),

          const SizedBox(height: 50,),
          ElevatedButton(onPressed: (){

            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.signOut().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LogInPage())));
          },
              child: const Text("Sign Out"))

        ],
      ),
    );
  }
}
