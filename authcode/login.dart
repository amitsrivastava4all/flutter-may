import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGmail extends StatefulWidget {
  @override
  _LoginWithGmailState createState() => _LoginWithGmailState();
}

class _LoginWithGmailState extends State<LoginWithGmail> {
  String name;
  String photo;
  String defaultPhoto = 'https://img.icons8.com/clouds/2x/user.png';
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  _login() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult result = await auth.signInWithCredential(authCredential);
    FirebaseUser user = result.user;
    print("***************After Authentication User is $user");
    print('Name is ${user.displayName}');
    print('Photo is ${user.photoUrl}');
    setState(() {
      name = user.displayName;
      photo = user.photoUrl;
    });
  }

  _logout() {
    googleSignIn.signOut();
    print("Signout done...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Gmail'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Your Name is ${name ?? ''}'),
            Container(
              child: Image.network(photo != null ? photo : defaultPhoto),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                _login();
              },
              child: Text('Login with Gmail'),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                _logout();
              },
              color: Colors.red,
              child: Text('LogOut'),
            )
          ],
        ),
      ),
    );
  }
}
