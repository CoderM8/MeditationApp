import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/controller_constant.dart';
import 'package:meditation/model/home_model/cat_list_model.dart';
import 'package:meditation/views/screens/Catlist_Category.dart';

class ChoiceChipsWidget extends StatefulWidget {
  ChoiceChipsWidget({Key? key}) : super(key: key);

  @override
  State<ChoiceChipsWidget> createState() => _ChoiceChipsWidgetState();
}

class _ChoiceChipsWidgetState extends State<ChoiceChipsWidget> {
  // final HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    kHomeController.categoryService();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.0.w),
          height: 35.23.h,
          child: StreamBuilder<CatListModel?>(
            stream: kHomeController.catListModel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.relaxMeditation.length,
                    itemBuilder: (BuildContext context, int index) =>
                        index % 2 == 0
                            ? InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CatListCategory(
                                            id: snapshot.data!
                                                .relaxMeditation[index].cid,
                                            name: snapshot
                                                .data!
                                                .relaxMeditation[index]
                                                .categoryName);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    border: Border.all(
                                        color: Colors.white24, width: 1.w),
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 4.w),
                                        CircleAvatar(
                                          radius: 10.0,
                                          backgroundImage: NetworkImage(snapshot
                                                  .data
                                                  ?.relaxMeditation[index]
                                                  .categoryImage ??
                                              ''),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          snapshot.data!.relaxMeditation[index]
                                              .categoryName,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Text(""));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ), //
        ),
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.only(left: 10.0.w),
          height: 35.23.h,
          child: StreamBuilder<CatListModel?>(
            stream: kHomeController.catListModel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.relaxMeditation.length,
                    itemBuilder: (BuildContext context, int index) =>
                        index % 2 != 0
                            ? InkWell(
                                onTap: () {
                                  Get.to(
                                    CatListCategory(
                                        id: snapshot
                                            .data!.relaxMeditation[index].cid,
                                        name: snapshot
                                            .data!
                                            .relaxMeditation[index]
                                            .categoryName),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    border: Border.all(
                                        color: Colors.white24, width: 1.w),
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 4.w),
                                        CircleAvatar(
                                          radius: 10.0,
                                          backgroundImage: NetworkImage(snapshot
                                                  .data
                                                  ?.relaxMeditation[index]
                                                  .categoryImage ??
                                              ''),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          snapshot.data?.relaxMeditation[index]
                                                  .categoryName ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Text(""));
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
