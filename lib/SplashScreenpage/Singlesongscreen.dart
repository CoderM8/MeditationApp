import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Singlesongplay.dart';

class singlesongscreen extends StatelessWidget {
  const singlesongscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/images/Singlesongplayerscreen.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context, rootNavigator: true).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return bottom_navigatorpage();
                            //     },
                            //   ),
                            // );
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 236, right: 30),
                    child: Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 90.h,
                              width: 90.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/Grouppay.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 34.62,
                                  right: 31.15,
                                  top: 31.15,
                                  bottom: 27.69),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Singlesongplay();
                                      },
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/Vectorpay.svg',
                                  // height: 26.h,
                                  // width: 26.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 58.h),
                  Column(
                    children: [
                      Text(
                        "Suggestion meditation",
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "LONELY",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ),
                      SizedBox(height: 23.h),
                      Text(
                        "padshala jagruti",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
