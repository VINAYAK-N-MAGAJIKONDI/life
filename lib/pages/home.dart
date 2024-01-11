import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'base.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user != null? base() : _googleSigninbutton(),

    );
  }

  Widget _googleSigninbutton() {
    return Center(

      child: SizedBox(
        height: 50,
        child: SignInButton(
          Buttons.google , text:" Google Sign up " , onPressed: _handlegsign,
        ),
      ),
    );
  }


// I'm Anagha.
  void _handlegsign() async {
    try {
      GoogleAuthProvider _googleprovider = GoogleAuthProvider();
      UserCredential userCredential = await _auth.signInWithPopup(_googleprovider);
      User? user = userCredential.user;

      setState(() {
        _user = user;
      });
    } catch (error) {
      print(error);
    }
  }

}
