import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'base.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';



class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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

      // Check if the platform is web
      if (kIsWeb) {
        print("Signing in with popup...");
        UserCredential userCredential = await _auth.signInWithPopup(_googleprovider);
        print("Signed in with popup");
        User? user = userCredential.user;

        setState(() {
          _user = user;
        });
      } else {
        print("Signing in on Android...");
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);
        print("Signed in on Android");
        User? user = userCredential.user;

        setState(() {
          _user = user;
        });
      }
    } catch (error) {
      print("Error signing in: $error");
    }
  }
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If the user cancels the sign-in process
      if (googleUser == null) {
        return null;
      }

      // Obtain GoogleSignInAuthentication
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential using the GoogleSignInAuthentication
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      print("Signed in on Android");
      User? user = userCredential.user;

      setState(() {
        _user = user;
      });
      // Return the user object
      return userCredential.user;
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }




}
