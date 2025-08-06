
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register/sing_up_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String address = "";
  String number = "";
  String gender = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? '';
      lastName = prefs.getString('lastName') ?? '';
      email = prefs.getString('email') ?? '';
      address = prefs.getString('address') ?? '';
      number = prefs.getString('number') ?? '';
      gender = prefs.getString('gender') ?? '';
    });
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // logout and clear all saved data
    Get.offAll(() => SignUpPage());
    Get.snackbar("Logout", "You have been logged out");
  }

  Future<void> showLogoutDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                logoutUser();
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.greenAccent,
          actions: [
            InkWell(
              onTap:showLogoutDialog,
              child: CircleAvatar(child: Image(image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpd4mJRIUwqgE8D_Z2znANEbtiz4GhI4M8NQ&s"),height: 25,width: 25,fit: BoxFit.cover,),),
            ),SizedBox(width: 25,)]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text("Name:$firstName $lastName", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Gender: $gender", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Number: $number", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Address: $address", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
