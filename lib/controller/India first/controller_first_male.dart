import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:chat_app/Response_to_json/First/male.dart';

class FormController {

  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbxy9gPe_qEzTxrrE1I7BzBwyMmwLQ2Sq3K_R8swr0Hbvw8B334/exec";

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