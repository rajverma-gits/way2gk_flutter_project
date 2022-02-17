import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:chat_app/Response_to_json/capitals.dart';

class FormController {

  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbz12zDTvXNDO_oDmbQH9BQ8e9YhlCbF6kZAvLIbdqtofyzLy7_t/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which loads feedback from endpoint URL and returns List.
  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
}