import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/pages/register_page.dart';
import 'package:miniproject/services/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';*/

import 'teach_tab1_page.dart';
import 'teach_tab2_page.dart';

class TeacherHomePage extends StatefulWidget {
  TeacherHomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;

  final String userId;

  @override
  State<StatefulWidget> createState() => new _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  //final FirebaseDatabase _database = FirebaseDatabase.instance;
  String name = "";

  @override
  void initState() {
    super.initState();
    getCachedData();
  }

  getCachedData() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        name = prefs.getString('name');
      });
    });
  }

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    try {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Registration()),
          (route) => false);
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.arrow_drop_down),
                  text: "Take Attendance",
                ),
                Tab(icon: Icon(Icons.book), text: "View Records"),
              ],
            ),
            title: Text(
              'Smart Attendance',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.pinkAccent,
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  onPressed: signOut),
            ],
          ),
          body: TabBarView(
            children: [
              TeacherBasicPage(),
              TeacherBasicSecPage(),
            ],
          ),
        ),
      ),
    );
  }
}
