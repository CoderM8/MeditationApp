// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:meditation/services/admobads.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/views/screens/profile/language_constant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'views/screens/Splash Screen/splash_screen.dart';

var localStorageUserId;
var onBoarding;
var logger = Logger();
GetStorage getStorage = GetStorage();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.isDenied.then((value) async {
    if (value) {
      await Permission.storage.request();
    }
  });

  const String oneSignalAppId = "4d627190-b25d-44c5-9a09-bc32ad651b36";

  OneSignal.initialize(oneSignalAppId);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.Notifications.requestPermission(true);

  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getAdData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;
  await LocalStorageServices().getBool('OnBoarding') == null
      ? LocalStorageServices().setBool(false, 'OnBoarding')
      : LocalStorageServices().getBool('OnBoarding').then((value) async {
          await LocalStorageServices().getBool('OnBoarding').then((value) {});
        });
  onBoarding = await LocalStorageServices().getBool('OnBoarding') == null
      ? false
      : await LocalStorageServices().getBool('OnBoardingScreen');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    print("Hello This is Main Screen $newLocale");
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    print("This is setLocale  in main $locale");
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
        print("did change Dependencies $locale");
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Main Function ui ld :$_locale");
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          locale: _locale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: ThemeData(
              primarySwatch: Colors.teal,
              colorScheme: ColorScheme.light(primary: Color(0XFF0C5162))),
          home: SplashScreen(),
        );
      },
    );
  }
}
