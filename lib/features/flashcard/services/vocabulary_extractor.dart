class VocabularyExtractor {
  static const _easyWords = {
    'a',
    'an',
    'and',
    'are',
    'as',
    'at',
    'be',
    'been',
    'but',
    'by',
    'can',
    'do',
    'for',
    'from',
    'had',
    'has',
    'have',
    'he',
    'her',
    'his',
    'i',
    'if',
    'in',
    'is',
    'it',
    'its',
    'me',
    'my',
    'not',
    'of',
    'on',
    'or',
    'our',
    'she',
    'so',
    'that',
    'the',
    'their',
    'them',
    'they',
    'this',
    'to',
    'up',
    'us',
    'was',
    'we',
    'were',
    'will',
    'with',
    'you',
    'your',
  };

  static const _phraseLinks = {
    'about',
    'across',
    'after',
    'against',
    'around',
    'away',
    'back',
    'down',
    'for',
    'from',
    'into',
    'of',
    'off',
    'on',
    'out',
    'over',
    'through',
    'to',
    'up',
    'with',
  };

  List<String> extract(
    String text, {
    bool preferPhrases = true,
    bool skipEasyWords = true,
    int limit = 20,
  }) {
    final tokens = RegExp(
      r"[A-Za-z]+(?:'[A-Za-z]+)?",
    ).allMatches(text).map((match) => match.group(0)!.toLowerCase()).toList();
    final candidates = <String>[];

    if (preferPhrases) {
      for (var index = 0; index < tokens.length - 1; index++) {
        final first = tokens[index];
        final second = tokens[index + 1];
        final phrase = '$first $second';
        final isLinkedPhrase =
            _phraseLinks.contains(second) || _phraseLinks.contains(first);
        final isLexicalChunk = first.length >= 5 && second.length >= 5;
        if ((isLinkedPhrase || isLexicalChunk) &&
            !_easyWords.contains(first) &&
            phrase.length <= 80) {
          candidates.add(phrase);
        }
      }
    }

    final frequencies = <String, int>{};
    for (final token in tokens) {
      if (token.length < 3 || (skipEasyWords && _easyWords.contains(token))) {
        continue;
      }
      frequencies.update(token, (count) => count + 1, ifAbsent: () => 1);
    }
    final rankedWords = frequencies.keys.toList()
      ..sort((left, right) {
        final frequencyComparison = frequencies[right]!.compareTo(
          frequencies[left]!,
        );
        return frequencyComparison != 0
            ? frequencyComparison
            : right.length.compareTo(left.length);
      });
    candidates.addAll(rankedWords);

    return candidates.toSet().take(limit).toList();
  }
}
