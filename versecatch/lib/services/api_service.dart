import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/verse.dart';

class ApiService {
  static const String _baseUrl = 'http://localhost:8000/api/v1';

  static Future<List<VerseMatch>> detectVerse(String text,
      {String language = 'auto'}) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/detect'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'text': text, 'language': language}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final matches = (data['matches'] as List)
            .map((m) => VerseMatch.fromJson(m))
            .toList();
        return matches;
      }
      return [];
    } on SocketException {
      return [];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> checkHealth() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/health'))
          .timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
