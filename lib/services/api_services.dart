import 'dart:convert';

import 'package:http/http.dart' as http;

var apiLink = 'https://opentdb.com/api.php?amount=20&category=11&difficulty=easy&type=multiple';

getQuizData() async {
  var res = await http.get(Uri.parse(apiLink));

  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    return data;
  }
}
