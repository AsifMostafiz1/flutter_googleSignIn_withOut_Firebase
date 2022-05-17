import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signinwithout_firebase/HomePage.dart';


GoogleSignIn _googleSignIn = GoogleSignIn();
class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GoogleSignInAccount? _currentUser;
  GoogleSignIn? googleSignIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage(user: _currentUser!)));
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
              final  user = await _googleSignIn.signIn();
              if(user!=null){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage(user: user)));
              }
          },
          child: const Text("Google Sign In"),
        ),
      ),
    );
  }
}
