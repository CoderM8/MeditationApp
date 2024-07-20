import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../Constant/constant.dart';
import '../main.dart';

/// set 'false' to hide all ADS
bool showInAppAds = true;

String get getBannerAdUnitId {
  if (Platform.isIOS) {
    return bannerIOS;
  } else if (Platform.isAndroid) {
    return bannerAndroid;
  }
  return 'Platform Exception';
}

String isInterstial = '';
String isBanner = '';

String bannerIOS = '';
String bannerAndroid = '';
String interstitialAndroid = '';
String interstitialIOS = '';
String interstitialAdClick = '';
InterstitialAd? interstitialAd;
RxString version = ''.obs;
RxInt clickCount = 0.obs;
RxBool isLoopActive = false.obs;
void showInterstitialAdOnClickEvent() {
  if (clickCount.value == int.parse(interstitialAdClick)) {
    admobads().showInterstitialAd();
    isLoopActive.value = true;
    clickCount.value = 0;
  } else {
    clickCount.value++;
  }
} // Update UI after state changes


getAdData() async {
  MobileAds.instance.initialize();
  // MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //     testDeviceIds: ['33BE2250B43518CCDA7DE426D04EE231']));
  try {
    final request = http.MultipartRequest('POST', Uri.parse(Api.mainApi));
    request.fields['data'] =
        '{"method_name":"app_details","package_name":"com.eng.audiobook"}';
    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      var finalres = json.decode(response.body);
      version.value = finalres['RELAX_MEDITATION'][0]['app_version'].toString();
      interstitialAdClick = finalres['RELAX_MEDITATION'][0]['interstital_ad_click'];
      isInterstial = Platform.isAndroid
          ? finalres['RELAX_MEDITATION'][0]['interstital_ad']
          : finalres['RELAX_MEDITATION'][0]['ios_interstital_ad'];
      isBanner = Platform.isAndroid
          ? finalres['RELAX_MEDITATION'][0]['banner_ad']
          : finalres['RELAX_MEDITATION'][0]['ios_banner_ad'];

      bannerAndroid = finalres['RELAX_MEDITATION'][0]['banner_ad_id'];
      interstitialAndroid =
          finalres['RELAX_MEDITATION'][0]['interstital_ad_id'];
      bannerIOS = finalres['RELAX_MEDITATION'][0]['ios_banner_ad_id'];
      interstitialIOS =
          finalres['RELAX_MEDITATION'][0]['ios_interstital_ad_id'];
    }

    admobads().createInterstitialAd();
    // admobads().bannerads();
  } catch (e, t) {
    logger.log(Level.error, 'ads error ===== $e', stackTrace: t);
  }
}

String get interstitalAd {
  if (Platform.isIOS) {
    return interstitialIOS;
  } else if (Platform.isAndroid) {
    return interstitialAndroid;
  }
  return 'Platform Exception';
}

class admobads {
  Widget bannerads() {
    final googleBannerAd = BannerAd(
      adUnitId: getBannerAdUnitId,
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
        },
        onAdFailedToLoad: (ad, err) {
          logger.log(
            Level.error,
            'BannerAd failed to load: $err',
          );
          ad.dispose();
        },
      ),
      request: AdRequest(),
    )..load();
    return isBanner == '1'
        ? Container(
            color: Colors.black12,
            alignment: Alignment.bottomCenter,
            width: googleBannerAd.size.width.toDouble(),
            height: googleBannerAd.size.height.toDouble(),
            child: AdWidget(ad: googleBannerAd),
          )
        : SizedBox.shrink();
  }

  /// Interstitial Ads

  int maxFailedLoadAttempts = 3;
  int numInterstialAdLoadAttempt = 0;

  static final AdRequest request = AdRequest(
    keywords: ['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  InterstitialAd? createInterstitialAd() {
    try {
      InterstitialAd.load(
          adUnitId: interstitalAd,
          request: request,
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              interstitialAd = ad;
              maxFailedLoadAttempts = 0;
              interstitialAd!.setImmersiveMode(true);
            },
            onAdFailedToLoad: (LoadAdError error) {
              numInterstialAdLoadAttempt += 1;
              if (numInterstialAdLoadAttempt < maxFailedLoadAttempts) {
                admobads().createInterstitialAd();
              }
            },
          ));
    } catch (e) {}
    return null;
  }

  void showInterstitialAd() {
    if (interstitialAd == null) {
      return;
    }
    if (isInterstial == '1') {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {},
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
        },
      );
      interstitialAd!.show();
      interstitialAd = null;
    }
  }
}
