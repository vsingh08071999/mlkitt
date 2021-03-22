import 'package:flutter/material.dart';
import 'package:mlkit_demo/bloc/AuthBloc.dart';
import 'package:mlkit_demo/loginScreen/AdminSignIn.dart';
// import 'package:mlkit_demo/scanner/scannerHomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ScannerHomeScreen()));
            },
            color: Colors.red,
            child: Text("NextPage"),
          ),
          RaisedButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => NewScreen()));
            },
            color: Colors.red,
            child: Text("New Screen"),
          ),
          RaisedButton(
            onPressed: () {
              context.bloc<AuthBloc>().signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              });

            },
            color: Colors.red,
            child: Text("logOut"),
          )
        ],
      ),
    );
  }
}
