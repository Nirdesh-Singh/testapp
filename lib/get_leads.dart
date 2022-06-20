import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GetLeads {
  var name = [];
  var email = [];
  var number = [];

  //GetLeads({this.name, this.email, this.number});

  makePostRequest() async {
    final uri = Uri.parse('https://notaryapi1.herokuapp.com/lead/getLeads');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {"notaryId": "62421089c913294914a8a35f"};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    var response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    //int statusCode = response.statusCode;
    String responseBody = response.body;
    // print(responseBody);

    Map data = json.decode(responseBody);
    // print(data['leads'][0]['name']);
    //print(data['leads'].length);

    // var name = [];
    // var email = [];
    // var number = [];

    for (var i = 0; i < data['leads'].length; i++) {
      name.insert(i, data['leads'][i]['name']);
      email.insert(i, data['leads'][i]['email']);
      number.insert(i, data['leads'][i]['PhoneNumber']);
    }

    // print(name);
    // print(email);
    // print(number);
  }
}
