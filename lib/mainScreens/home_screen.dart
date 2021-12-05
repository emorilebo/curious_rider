import 'package:curious_rider/authentication/auth_screen.dart';
import 'package:curious_rider/global/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sharedPreferences!.getString("name")!,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          style: ElevatedButton.styleFrom(primary: Colors.cyan),
          onPressed: () {
            firebaseAuth.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const AuthScreen()));
            });
          },
        ),
      ),
    );
  }
}
