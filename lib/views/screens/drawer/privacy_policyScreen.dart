import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:meditation/Constant/constant.dart';
import 'package:meditation/Controller/privacyPolicy_Contoller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../../../model/privacy_policy_model.dart';
import '../../utils/textwidget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final AppInfoController appInfoController = Get.put(AppInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Styles.regular(S.of(context).privacyPolicy,
            fs: 24, c: Constant.whiteColor, fw: FontWeight.w500),
        centerTitle: true,
        backgroundColor: Constant.darkThemeColor,
        leading: BackButton(color: Constant.whiteColor),
      ),
      body: StreamBuilder<AppInfoModel>(
          stream: appInfoController.appInfoModel.stream,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Html(
                  data:
                      snapshot.data?.relaxMeditation?[0].appPrivacyPolicy ?? '',
                  onLinkTap: (url, attributes, element) {
                    _launchUrl(url ?? '');
                  },
                  doNotRenderTheseTags: Set(),
                  style: {}),
              padding: EdgeInsets.all(8.0),
            );
          }),
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}
