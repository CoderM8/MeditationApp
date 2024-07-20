import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../views/utils/profile_Button_Widget.dart';
import '../views/utils/textwidget.dart';
import 'EditProfilepage.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: Image.asset(
                  "assets/images/Home Screen.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 812.h,
                width: 375.w,
                child: Padding(
                  padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Center(
                        child: Styles.regular(
                          "Profile",
                          fw: FontWeight.bold,
                          fs: 20.sp,
                          c: Colors.white,
                        ),
                      ),
                      SizedBox(height: 23.h),
                      Row(
                        children: [
                          Container(
                            height: 71.h,
                            width: 71.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Styles.regular(
                            "Vocsy Kanudo",
                            fs: 18.sp,
                            c: Colors.white,
                          ),
                          SizedBox(width: 34.w),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/Group 298.svg',
                              height: 26.h,
                              width: 26.w,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EditProfilepage();
                                  },
                                ),
                              );

                              print("jagu");
                            },
                            child: SvgPicture.asset(
                              'assets/icons/Vectorsetting.svg',
                              height: 26.h,
                              width: 26.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        width: 333,
                        height: 111,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Container(
                        child: Text(
                          "My Stats",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 333,
                        height: 172,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Column(
                        children: [
                          ProfileButtonPage(
                            // icon: "assets/icons/Groupprofile.svg",
                            height: 18.h,
                            width: 18.w,
                            hint: "Join Premium",
                          ),
                          SizedBox(height: 20.h),
                          ProfileButtonPage(
                            // icon: "assets/icons/Groupprofile.svg",
                            height: 18.h,
                            width: 18.w,
                            hint: "Badges",
                          ),
                          SizedBox(height: 20.h),
                          ProfileButtonPage(
                            // icon: "assets/icons/Groupprofile.svg",
                            height: 18.h,
                            width: 18.w,
                            hint: "My Favorites",
                          ),
                          SizedBox(height: 20.h),
                          ProfileButtonPage(
                            // icon: "assets/icons/Groupprofile.svg",
                            height: 18.h,
                            width: 18.w,
                            hint: "Change Language",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget texttitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
