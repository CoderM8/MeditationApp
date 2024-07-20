import 'package:http/http.dart' as http;
import '../../Constant/constant.dart';

class BaseNetworkApi {
  Future apiPost({required String body}) async {
    var req = http.MultipartRequest('POST', Uri.parse(Api.mainApi));
    req.fields['data'] = body;
    http.Response response = await http.Response.fromStream(await req.send());
    if (response.statusCode == 200) {
      // print('RESPONSE BODY ----- ${response.body}');
      return response.body;
    }
  }
}
