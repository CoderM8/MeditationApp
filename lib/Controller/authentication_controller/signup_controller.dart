import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditation/Services/authentication_services/singnup_service.dart';
// import 'package:meditation/model/authentication_model/signup_models.dart';
import 'package:meditation/constant/constant.dart';

import '../../model/authentication_model/signUpTypeNormalModel.dart';

class SignupController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RxString type = "1".obs;
  final formKey = GlobalKey<FormState>();
  SignUpTypeNormalModel? userModel;

  var selectedImagePath = ''.obs;
  RxBool isCheck = false.obs;

  XFile? file;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      file = pickedFile;
      update();
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No Image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Constant.blackColor,
          colorText: Constant.whiteColor);
    }
  }

  Future<SignUpTypeNormalModel?> signupControl(
      {required BuildContext context,
      userController,
      emailController,
      passwordController,
      type}) async {
    try {
      userModel = await AuthService().signup(
          context: context,
          email: emailController,
          password: passwordController,
          name: userController,
          type: 'Normal');
      return userModel;
    } catch (e) {
      print("{Error in Signup $e");
    }
    return null;
  }
}
