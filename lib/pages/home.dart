import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      body: _user != null ? base() : signinpage(),
    );
  }

  Widget signinpage() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'under.jpg'), // Replace with your image asset path
            fit: BoxFit.fill,
          ),
        ),
        child: _googleSigninbutton(),
      ),
    );
  }

  Widget _googleSigninbutton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MARINE MARVEL',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.teal, // Change the color to aqua theme
            ),
          ),
          SizedBox(height: 20),
          SignInButton(
            Buttons.google,
            text: " Google Sign up ",
            onPressed: _handlegsign,
          ),
        ],
      ),
    );
  }

  void _handlegsign() async {
    try {
      GoogleAuthProvider _googleprovider = GoogleAuthProvider();

      // Check if the platform is web
      if (kIsWeb) {
        print("Signing in with popup...");
        UserCredential userCredential =
            await _auth.signInWithPopup(_googleprovider);
        print("Signed in with popup"+userCredential.additionalUserInfo!.isNewUser.toString());
        User? user = userCredential.user;
        if(userCredential.additionalUserInfo!.isNewUser){
          await _initializeUserData(user!.uid);

        }
        print(userCredential.additionalUserInfo!.isNewUser.toString() + "hello this is state ");



        setState(() {
          _user = user;
        });
      } else {
        print("Signing in on Android...");
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        print("Signed in on Android");
        User? user = userCredential.user;

        if(userCredential.additionalUserInfo!.isNewUser){
          await _initializeUserData(user!.uid);

        }

        setState(() {
          _user = user;
        });
      }
    } catch (error) {
      print("Error signing in: $error");
    }
  }
  Future<void> _initializeUserData(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'uid': _auth.currentUser?.uid,
        'cash': 0,
        'cleanups': 0,
        'donations': 0,
        'coupans': 1,
        'recycle': 0,
        // Add other standard user details here
      });
      await _firestore.collection('rewards').doc(uid).set({
        'uid': _auth.currentUser?.uid,
        'brand': 'Marine Marvel',
        'discount': 50,

        // Add other standard user details here
      });

    } catch (e) {
      print('Error initializing user data: $e');
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
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential using the GoogleSignInAuthentication
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
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
