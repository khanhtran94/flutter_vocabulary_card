import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class TranslationService {
  Future<String> translateToVietnamese(String english);
}

class TranslationException implements Exception {
  const TranslationException(this.message);

  final String message;

  @override
  String toString() => message;
}

class MyMemoryTranslationService implements TranslationService {
  MyMemoryTranslationService({http.Client? client})
    : _client = client ?? http.Client();

  final http.Client _client;

  @override
  Future<String> translateToVietnamese(String english) async {
    final uri = Uri.https('api.mymemory.translated.net', '/get', {
      'q': english,
      'langpair': 'en|vi',
    });
    final response = await _client
        .get(uri)
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw TranslationException(
        'Dịch vụ dịch trả về lỗi ${response.statusCode}.',
      );
    }

    final payload = jsonDecode(utf8.decode(response.bodyBytes));
    if (payload is! Map<String, dynamic> ||
        payload['responseStatus'] != 200 ||
        payload['responseData'] is! Map<String, dynamic>) {
      throw const TranslationException('Phản hồi dịch không hợp lệ.');
    }
    final translated =
        (payload['responseData'] as Map<String, dynamic>)['translatedText'];
    if (translated is! String || translated.trim().isEmpty) {
      throw const TranslationException('Không nhận được bản dịch.');
    }
    return translated.trim();
  }
}
