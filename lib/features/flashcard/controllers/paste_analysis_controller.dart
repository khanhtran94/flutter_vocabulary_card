import 'package:flutter/foundation.dart';

import '../services/translation_service.dart';
import '../services/vocabulary_extractor.dart';

class VocabularyCandidate {
  const VocabularyCandidate({required this.english, required this.vietnamese});

  final String english;
  final String vietnamese;

  bool get isPhrase => english.contains(' ');
}

class PasteAnalysisController extends ChangeNotifier {
  PasteAnalysisController({
    required VocabularyExtractor extractor,
    required TranslationService translationService,
  }) : _extractor = extractor,
       _translationService = translationService;

  final VocabularyExtractor _extractor;
  final TranslationService _translationService;

  bool isAnalyzing = false;
  String? errorMessage;
  List<VocabularyCandidate> candidates = const [];

  Future<bool> analyze(
    String text, {
    bool preferPhrases = true,
    bool skipEasyWords = true,
  }) async {
    if (text.trim().isEmpty) {
      errorMessage = 'Hãy dán một đoạn tiếng Anh trước.';
      notifyListeners();
      return false;
    }
    final extracted = _extractor.extract(
      text,
      preferPhrases: preferPhrases,
      skipEasyWords: skipEasyWords,
    );
    if (extracted.isEmpty) {
      errorMessage = 'Không tìm thấy từ hoặc cụm từ phù hợp.';
      notifyListeners();
      return false;
    }

    isAnalyzing = true;
    errorMessage = null;
    candidates = const [];
    notifyListeners();
    try {
      final translated = <VocabularyCandidate>[];
      for (final english in extracted) {
        final vietnamese = await _translationService.translateToVietnamese(
          english,
        );
        translated.add(
          VocabularyCandidate(english: english, vietnamese: vietnamese),
        );
      }
      candidates = translated;
      return true;
    } on TranslationException catch (error) {
      errorMessage = error.message;
      return false;
    } catch (_) {
      errorMessage = 'Không thể kết nối dịch vụ dịch. Hãy kiểm tra mạng.';
      return false;
    } finally {
      isAnalyzing = false;
      notifyListeners();
    }
  }
}
