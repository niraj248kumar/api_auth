import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/Home_page.dart';
import 'apiService.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();


  void signupUser() async {
    isLoading.value = true;

    final success = await ApiService.signup(
      firstName: firstNameController.text,
      address: addressController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      number: phoneController.text,
      gender: genderController.text,
      agentId: '12',
      referralCode: '54',
      otherReferralCode: '12',
      fcmToken: '15',
      updatedAt: '2025-06-06T11:06:08.000000Z',
      createdAt: '2025-06-06T11:06:08.000000Z',
      userId: '21',
      password: passwordController.text,
    );
    isLoading.value = false;
    if (success) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isSignedUp', true);
      await prefs.setString('firstName', firstNameController.text);
      await prefs.setString('lastName', lastNameController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('number', phoneController.text);
      await prefs.setString('gender', genderController.text);
      await prefs.setString('address', addressController.text);
      Get.offAll(() => HomePage());
      Get.snackbar("Success", "Signup Successful");
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      passwordController.clear();
    } else {
      Get.snackbar("Error", "Signup Failed");
    }
  }

  void loginUser() async {
    final response = await ApiService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (response['status'] == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['token'] ?? '');
      Get.to(HomePage());
      Fluttertoast.showToast(msg: "Login Success!");
    } else {
      Fluttertoast.showToast(msg: "Login Failed: ${response['message']}");
    }
  }
}
