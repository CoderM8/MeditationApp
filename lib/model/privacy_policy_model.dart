// To parse this JSON data, do
//
//     final appInfoModel = appInfoModelFromJson(jsonString);

import 'dart:convert';

AppInfoModel appInfoModelFromJson(String str) =>
    AppInfoModel.fromJson(json.decode(str));

String appInfoModelToJson(AppInfoModel data) => json.encode(data.toJson());

class AppInfoModel {
  List<RelaxMeditation>? relaxMeditation;

  AppInfoModel({
    this.relaxMeditation,
  });

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => AppInfoModel(
        relaxMeditation: List<RelaxMeditation>.from(
            json["RELAX_MEDITATION"].map((x) => RelaxMeditation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RELAX_MEDITATION":
            List<dynamic>.from(relaxMeditation!.map((x) => x.toJson())),
      };
}

class RelaxMeditation {
  String? appName;
  String? appLogo;
  String? appVersion;
  String? appAuthor;
  String? appContact;
  String? appEmail;
  String? appWebsite;
  String? appDescription;
  String? appDevelopedBy;
  String? appPrivacyPolicy;
  String? packageName;
  String? publisherId;
  String? interstitalAd;
  String? interstitalAdType;
  String? interstitalAdId;
  String? interstitalAdClick;
  String? bannerAd;
  String? bannerAdType;
  String? bannerAdId;
  String? nativeAd;
  String? nativeAdType;
  String? nativeAdId;
  String? nativePosition;
  String? songDownload;
  String? appUpdateStatus;
  String? appNewVersion;
  String? appUpdateDesc;
  String? appRedirectUrl;
  String? cancelUpdateStatus;

  RelaxMeditation({
    this.appName,
    this.appLogo,
    this.appVersion,
    this.appAuthor,
    this.appContact,
    this.appEmail,
    this.appWebsite,
    this.appDescription,
    this.appDevelopedBy,
    this.appPrivacyPolicy,
    this.packageName,
    this.publisherId,
    this.interstitalAd,
    this.interstitalAdType,
    this.interstitalAdId,
    this.interstitalAdClick,
    this.bannerAd,
    this.bannerAdType,
    this.bannerAdId,
    this.nativeAd,
    this.nativeAdType,
    this.nativeAdId,
    this.nativePosition,
    this.songDownload,
    this.appUpdateStatus,
    this.appNewVersion,
    this.appUpdateDesc,
    this.appRedirectUrl,
    this.cancelUpdateStatus,
  });

  factory RelaxMeditation.fromJson(Map<String, dynamic> json) =>
      RelaxMeditation(
        appName: json["app_name"],
        appLogo: json["app_logo"],
        appVersion: json["app_version"],
        appAuthor: json["app_author"],
        appContact: json["app_contact"],
        appEmail: json["app_email"],
        appWebsite: json["app_website"],
        appDescription: json["app_description"],
        appDevelopedBy: json["app_developed_by"],
        appPrivacyPolicy: json["app_privacy_policy"],
        packageName: json["package_name"],
        publisherId: json["publisher_id"],
        interstitalAd: json["interstital_ad"],
        interstitalAdType: json["interstital_ad_type"],
        interstitalAdId: json["interstital_ad_id"],
        interstitalAdClick: json["interstital_ad_click"],
        bannerAd: json["banner_ad"],
        bannerAdType: json["banner_ad_type"],
        bannerAdId: json["banner_ad_id"],
        nativeAd: json["native_ad"],
        nativeAdType: json["native_ad_type"],
        nativeAdId: json["native_ad_id"],
        nativePosition: json["native_position"],
        songDownload: json["song_download"],
        appUpdateStatus: json["app_update_status"],
        appNewVersion: json["app_new_version"],
        appUpdateDesc: json["app_update_desc"],
        appRedirectUrl: json["app_redirect_url"],
        cancelUpdateStatus: json["cancel_update_status"],
      );

  Map<String, dynamic> toJson() => {
        "app_name": appName,
        "app_logo": appLogo,
        "app_version": appVersion,
        "app_author": appAuthor,
        "app_contact": appContact,
        "app_email": appEmail,
        "app_website": appWebsite,
        "app_description": appDescription,
        "app_developed_by": appDevelopedBy,
        "app_privacy_policy": appPrivacyPolicy,
        "package_name": packageName,
        "publisher_id": publisherId,
        "interstital_ad": interstitalAd,
        "interstital_ad_type": interstitalAdType,
        "interstital_ad_id": interstitalAdId,
        "interstital_ad_click": interstitalAdClick,
        "banner_ad": bannerAd,
        "banner_ad_type": bannerAdType,
        "banner_ad_id": bannerAdId,
        "native_ad": nativeAd,
        "native_ad_type": nativeAdType,
        "native_ad_id": nativeAdId,
        "native_position": nativePosition,
        "song_download": songDownload,
        "app_update_status": appUpdateStatus,
        "app_new_version": appNewVersion,
        "app_update_desc": appUpdateDesc,
        "app_redirect_url": appRedirectUrl,
        "cancel_update_status": cancelUpdateStatus,
      };
}
