import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../GetXService/gerxService.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Sign Up")),backgroundColor: Colors.greenAccent,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.firstNameController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "First Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.lastNameController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Last Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Password"),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.addressController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.genderController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Gender"),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.phoneController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Number"),

              ),
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : SizedBox(
              width: double.infinity,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent) ,
                                onPressed: controller.signupUser,
                                child: Text("Sign Up",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                )),
            TextButton(
              onPressed:() {
                Get.to(LoginScreen());
              },
              child: Text("Already have an account? Login",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
