import 'package:http/http.dart' as http;
import 'package:thingsboard_app/constants/app_constants.dart';
import 'dart:convert';
import 'package:thingsboard_app/utils/services/global.dart' as globals;

postHttpCall(sendData) async {
  print('sendData------- $sendData');
  print(ThingsboardAppConstants.traxboarderApiEndpoint);
  // print(myInstance.traxboarderUrl);

  try {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': globals.token,
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            ThingsboardAppConstants.traxboarderApiEndpoint + sendData['url']));
    request.body = json.encode(sendData);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  } catch (e) {
    print(e.toString());
    return e;
  }
}

deleteHttpCall(sendData) async {
  print('sendData------- $sendData');
  try {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': globals.token,
    };
    print('http://18.202.23.197:5001/' + sendData['url']);
    var request = http.Request(
        'DELETE', Uri.parse('http://18.202.23.197:5001/' + sendData['url']));
    request.body = json.encode(sendData);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  } catch (e) {
    print(e.toString());
    return e;
  }
}

/*getHttpCall(sendData) async {
  print('sendData------- $sendData');
  try {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': globals.token,
    };
    print(url + sendData['url']);
    var request = http.Request('GET', Uri.parse(url + sendData['url']));
    request.body = json.encode(sendData);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  } catch (e) {
    print(e.toString());
    return e;
  }
} */
