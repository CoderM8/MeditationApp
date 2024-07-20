// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meditation/Controller/profile_controller.dart';
import 'package:meditation/views/screens/bottomnavigationbar/bottom_navigator.dart';
import 'package:meditation/views/utils/profile_Button_Widget.dart';

import '../../../constant/constant.dart';
import '../../../constant/image_constant.dart';
import '../../../generated/l10n.dart';
import '../../../services/localstorage/local_storage_services.dart';
import '../profile/Profilepage.dart';
import 'change_password_page.dart';

class EditProfilePage
    extends StatefulWidget {
  EditProfilePage(
      {Key? key,
      this.email,
      this.name,
      this.bDate,
      this.image,
      String? birthDate})
      : super(key: key);
  String? name;
  String? email;
  DateTime? bDate;
  String? image;

  @override
  State<EditProfilePage>
      createState() =>
          _EditProfilePageState();
}

class _EditProfilePageState
    extends State<EditProfilePage> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController
      _controller1;
  late DateTime dateBirth;
  final ProfileController controller =
      Get.put(ProfileController());

  @override
  void initState() {
    _controller1 =
        TextEditingController(
            text: DateFormat(
                    'MMM d, yyyy')
                .format(widget.bDate ??
                    DateTime.now()));
    name = TextEditingController(
        text: widget.name);
    email = TextEditingController(
        text: widget.email);
    // dateBirth =
    super.initState();
  }

  // var imageF;

  DateTime dateTime = DateTime.now();

  void takeProfilePhoto(
      ImageSource source,
      context) async {
    final ImagePicker _picker =
        ImagePicker();
    File? image = await _picker
        .pickImage(source: source)
        .then((value) async {
      // setState(() {
      if (value != null) {
        _cropImage(value);
        Get.back();
      } else {}
      return null;
    });
    return null;
  }

  // Add the below function inside your working class
  Future _cropImage(XFile? file) async {
    if (file != null) {
      CroppedFile? cropped =
          await ImageCropper()
              .cropImage(
                  sourcePath: file.path,
                  uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Crop',
                cropGridColor:
                    Colors.black,
                toolbarColor:
                    Color(0xFF002D38),
                initAspectRatio:
                    CropAspectRatioPreset
                        .original,
                lockAspectRatio: false,
                backgroundColor:
                    Colors.black,
                dimmedLayerColor:
                    Colors.black,
                toolbarWidgetColor:
                    Colors.white,
                aspectRatioPresets: [
                  CropAspectRatioPreset
                      .square,
                  CropAspectRatioPreset
                      .ratio3x2,
                  CropAspectRatioPreset
                      .original,
                  CropAspectRatioPreset
                      .ratio4x3,
                  CropAspectRatioPreset
                      .ratio16x9
                ],
                cropFrameColor:
                    Colors.white),
            IOSUiSettings(
              title: 'Crop',
              aspectRatioPresets: [
                CropAspectRatioPreset
                    .square,
                CropAspectRatioPreset
                    .ratio3x2,
                CropAspectRatioPreset
                    .original,
                CropAspectRatioPreset
                    .ratio4x3,
                CropAspectRatioPreset
                    .ratio16x9
              ],
            )
          ]);

      if (cropped != null) {
        setState(() {
          imageF.value = cropped.path;
        });
      }
    }
  }

  String birthdate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height:
              MediaQuery.sizeOf(context)
                  .height,
          // height: double.infinity,
          /// =================== Background Image ===================
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/Home Screen.jpg'),
                fit: BoxFit.cover),
          ),
          child: Container(
            height: 845,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 50.h,
                  left: 20.w,
                  right: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      /// =================== Edit Your Profile ===================
                      InkWell(
                        onTap: () {
                          Get.to(
                              BottomNavigator());
                        },
                        child: Icon(
                            Icons
                                .arrow_back,
                            color: Colors
                                .white,
                            size:
                                24.sp),
                      ),

                      /// =================== Edit Your Profile ===================
                      SizedBox(
                          width: 60.w),
                      textTitle(S
                          .of(context)
                          .editYourProfile),
                    ],
                  ),
                  SizedBox(
                      height: 18.h),
                  Center(
                    child: Stack(
                      children: [
                        /// =================== Image ===================
                        StreamBuilder<
                                String>(
                            stream: imageF
                                .stream,
                            builder:
                                (context,
                                    snapshot) {
                              return Container(
                                width:
                                    135.w,
                                height:
                                    140.h,
                                decoration: BoxDecoration(
                                    shape:
                                        BoxShape.circle,
                                    border: Border.all(color: Constant.kTransparent)),
                                child: imageF.value.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(200),
                                        child: Image.file(File(imageF.value), fit: BoxFit.fitWidth, width: 130.w, height: 150.h),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(200),
                                        child: Image.network(widget.image ?? '', fit: BoxFit.cover, width: 130.w, height: 150.h),
                                      ),
                              );
                            }),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child:
                              InkWell(
                            onTap:
                                () async {
                              showModalBottomSheet(
                                context:
                                    context,
                                builder:
                                    (context) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      /// =================== Camera ===================
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10, top: 10),
                                        height: 70.h,
                                        width: 152.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.r), // <-- Radius
                                            ),
                                            backgroundColor: Color(0xff06576A),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Image.network(cameraIcon, height: 40.h, width: 40.w, color: Constant.whiteColor),
                                              SizedBox(width: 8.h),
                                              Text(
                                                S.of(context).camera,
                                                style: TextStyle(color: Colors.white, fontSize: 18.sp, fontFamily: "Roboto regular"),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            takeProfilePhoto(ImageSource.camera, context);
                                          },
                                        ),
                                      ),

                                      /// =================== Gallery ===================
                                      SizedBox(width: 15.w),
                                      Container(
                                        height: 52.h,
                                        width: 152.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.r), // <-- Radius
                                            ),
                                            backgroundColor: Color(0xff06576A),
                                          ),
                                          child: Row(
                                            children: [
                                              Image.network(galleryIcon, height: 30.h, width: 30.w, color: Constant.whiteColor),
                                              SizedBox(width: 15.w),
                                              Text(
                                                S.of(context).gallery,
                                                style: TextStyle(fontFamily: "Roboto regular", color: Colors.white, fontSize: 18.sp),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            takeProfilePhoto(ImageSource.gallery, context);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },

                            /// =================== Camera Icon ===================
                            child:
                                Container(
                              height:
                                  40.h,
                              width:
                                  40.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape
                                      .circle,
                                  border: Border.all(
                                      width: 1,
                                      color: Theme.of(context).scaffoldBackgroundColor),
                                  color: Colors.white),
                              child: Icon(
                                  Icons
                                      .camera_alt,
                                  color:
                                      Color(0XFF002D38)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// =================== Name ===================
                  SizedBox(
                      height: 41.h),
                  Padding(
                    padding:
                        EdgeInsets.only(
                            left: 15.w,
                            right:
                                15.w),
                    child:
                        TextFormField(
                      controller: name,
                      decoration:
                          InputDecoration(
                        fillColor:
                            Colors
                                .white,
                        hoverColor:
                            Colors
                                .white,
                        enabledBorder:
                            UnderlineInputBorder(
                          borderSide:
                              const BorderSide(
                                  color:
                                      Colors.white),
                        ),
                        focusedBorder:
                            UnderlineInputBorder(
                          borderSide:
                              const BorderSide(
                                  color:
                                      Colors.white),
                        ),
                        icon: const Icon(
                            Icons
                                .person,
                            color: Colors
                                .white),
                        hintText:
                            'Enter your name',
                        hintStyle: TextStyle(
                            color: Colors
                                .white),
                        labelText:
                            'Name',
                        labelStyle: TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                                16.0.sp),
                      ),
                      style: TextStyle(
                          color: Colors
                              .white),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(
                            25)
                      ],
                      validator:
                          (value) {
                        if (value!
                            .isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // user.name = value!;
                      },
                    ),
                  ),

                  /// =================== Email ===================
                  SizedBox(
                      height: 15.h),
                  Padding(
                    padding:
                        EdgeInsets.only(
                            left: 15.w,
                            right:
                                15.w),
                    child:
                        TextFormField(
                      readOnly: true,
                      controller: email,
                      decoration:
                          const InputDecoration(
                        enabledBorder:
                            UnderlineInputBorder(
                          borderSide:
                              const BorderSide(
                                  color:
                                      Colors.white),
                        ),
                        focusedBorder:
                            UnderlineInputBorder(
                          borderSide:
                              const BorderSide(
                                  color:
                                      Colors.white),
                        ),
                        icon: const Icon(
                            Icons.email,
                            color: Colors
                                .white),
                        labelText:
                            'Email',
                        labelStyle: TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                                16.0),
                      ),
                      style: TextStyle(
                          color: Colors
                              .white),
                      onSaved: (value) {
                        //user.email = value!;
                      },
                    ),
                  ),

                  /// =================== Date & Time Picker ===================
                  SizedBox(
                      height: 15.h),
                  Padding(
                    padding:
                        EdgeInsets.only(
                            left: 15.w,
                            right:
                                15.w),
                    child:
                        TextFormField(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context:
                                context,
                            initialDate:
                                widget
                                    .bDate!,
                            firstDate:
                                DateTime(
                                    0000),
                            lastDate:
                                DateTime
                                    .now());
                        if (pickedDate !=
                            null) {
                          print(
                              pickedDate);
                          String
                              formattedDate =
                              DateFormat(
                                      'MMM d, yyyy')
                                  .format(
                                      pickedDate);
                          print(
                              formattedDate);
                          setState(() {
                            _controller1
                                    .text =
                                formattedDate;
                          });
                        } else {
                          print(
                              "Date is not selected");
                        }
                      },
                      readOnly: true,
                      controller:
                          _controller1,
                      decoration:
                          const InputDecoration(
                        enabledBorder:
                            UnderlineInputBorder(
                          borderSide:
                              const BorderSide(
                                  color:
                                      Colors.white),
                        ),
                        focusedBorder:
                            UnderlineInputBorder(
                          borderSide:
                              const BorderSide(
                                  color:
                                      Colors.white),
                        ),
                        icon: const Icon(
                            Icons.event,
                            color: Colors
                                .white),
                        labelText:
                            'Date of Birth',
                        labelStyle: TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                                16.0),
                      ),
                      style: TextStyle(
                          color: Colors
                              .white),
                    ),
                  ),

                  /// =================== Change Your Password ===================
                  SizedBox(
                      height: 23.h),
                  InkWell(
                    onTap: () {
                      Get.to(() =>
                          ChangePasswordPage(
                            image: widget
                                .image,
                            name: widget
                                .name,
                            bDate: widget
                                .bDate,
                            email: widget
                                .email,
                          ));
                    },
                    child: ProfileButtonPage(
                        icon: Icons
                            .password,
                        height: 18.h,
                        width: 18.w,
                        hint:
                            "Change your password"),
                  ),

                  /// =================== Update Button ===================
                  SizedBox(
                      height: 76.h),
                  StreamBuilder<String>(
                      stream:
                          imageF.stream,
                      builder: (context,
                          snapshot) {
                        return StreamBuilder<
                                String>(
                            stream: imageF
                                .stream,
                            builder:
                                (context,
                                    snapshot) {
                              return SizedBox(
                                width:
                                    333.w,
                                height:
                                    49.h,
                                child:
                                    ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white10,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                  onPressed:
                                      () async {
                                    if (imageF.value.isNotEmpty) {
                                      LocalStorageServices().setString(name.text, 'UserName');
                                      LocalStorageServices().setString(email.text, 'UserEmail');
                                      LocalStorageServices().setString(name.text[0], 'UserFirstAccount');
                                      print('UserName ===${await LocalStorageServices().getString('UserName')}');
                                      controller.UpdateProfile(email: email.text, name: name.text, phone: '', image: imageF.value, bDate: _controller1.text).then(
                                        (value) {
                                          controller.username.value = name.text;
                                          Get.back();
                                          Get.snackbar('Profile', '${value!.relaxMeditation[0].msg}');
                                        },
                                      );
                                    } else {
                                      Get.snackbar('Profile', 'Please Select Profile Image', backgroundColor: Colors.red.withOpacity(0.5), isDismissible: true, dismissDirection: DismissDirection.horizontal);
                                    }
                                  },
                                  child:
                                      Text(
                                    S.of(context).updateButton,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              );
                            });
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final RegExp phoneRegex =
      new RegExp(r'^[6-9]\d{9}$');

  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  Widget textTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold),
    );
  }
}
