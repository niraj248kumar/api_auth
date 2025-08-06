import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../GetXService/gerxService.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Login',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),backgroundColor: Colors.greenAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Password'),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(width:double.infinity,child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                onPressed: controller.loginUser, child: Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
          ],
        ),
      ),
    );
  }
}
