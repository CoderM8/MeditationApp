import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

RxBool cancel = true.obs;
RxInt progress = 0.obs;

Future<String?> downloadMp3({
  var songUrl,
  String? songtitle,
  String? image,
}) async {
  // final status = await Permission.storage.request();

  Directory? externaldir;
  var response;
  Dio dio = Dio();
  // SongPlayerController songPlayerController = Get.put(SongPlayerController());

  CancelToken canceltoken = CancelToken();

  progress.value = 0;
  cancel.value = true;
  try {
    // if (status.isGranted) {
    if (Platform.isIOS) {
      externaldir = await getApplicationDocumentsDirectory();
    }
    if (Platform.isAndroid) {
      externaldir = await getApplicationDocumentsDirectory();
    }

    response = await dio.download(
      songUrl,
      '${externaldir!.path}/$songtitle.mp3',
      cancelToken: canceltoken,
      onReceiveProgress: (rcv, total) {
        progress.value = int.parse(((rcv / total) * 100).toStringAsFixed(0));
        print('progress.value :: ${progress.value}');
      },
      deleteOnError: true,
    );

    return '${externaldir.path}/$songtitle.mp3';
    // } else {
    //   return null;
    // }
  } catch (e, trace) {
    if (kDebugMode) {
      print('ERROR ::  $e');
      print('TRACE :: $trace');
    }
    return null;
  }
}
