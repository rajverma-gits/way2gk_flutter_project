import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:chat_app/Response_to_json/union_territories.dart';

class FormController {

  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbxuwpPalom4_1uEMTyruXVtIf-MtI68qh8L4ARS1uvorsuOwCMv/exec";

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