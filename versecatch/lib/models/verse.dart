class VerseMatch {
  final String reference;
  final String book;
  final int chapter;
  final int verse;
  final String text;
  final double confidence;
  final String language;
  final DateTime detectedAt;

  VerseMatch({
    required this.reference,
    required this.book,
    required this.chapter,
    required this.verse,
    required this.text,
    required this.confidence,
    this.language = 'en',
    DateTime? detectedAt,
  }) : detectedAt = detectedAt ?? DateTime.now();

  factory VerseMatch.fromJson(Map<String, dynamic> json) {
    return VerseMatch(
      reference: json['reference'] ?? '',
      book: json['book'] ?? '',
      chapter: json['chapter'] ?? 0,
      verse: json['verse'] ?? 0,
      text: json['text'] ?? '',
      confidence: (json['confidence'] ?? 0).toDouble(),
      language: json['language'] ?? 'en',
    );
  }

  String get shortReference => '$book $chapter:$verse';

  bool get isHighConfidence => confidence >= 80;

  String get confidenceLabel {
    if (confidence >= 90) return 'Excellent';
    if (confidence >= 80) return 'Good';
    if (confidence >= 60) return 'Fair';
    return 'Low';
  }
}

class TranscriptSegment {
  final String text;
  final DateTime timestamp;

  TranscriptSegment({required this.text, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}
