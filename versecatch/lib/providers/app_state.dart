import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/verse.dart';
import '../services/api_service.dart';
import '../services/audio_service.dart';

class AppState extends ChangeNotifier {
  final AudioService _audioService = AudioService();

  bool _isListening = false;
  bool _isProcessing = false;
  bool _isBackendConnected = false;
  String _currentTranscript = '';
  String _detectedLanguage = 'en';
  String _preferredLanguage = 'en';
  bool _autoDetect = true;

  VerseMatch? _currentVerse;
  final List<VerseMatch> _verseHistory = [];
  final List<TranscriptSegment> _transcriptSegments = [];
  final List<String> _languages = ['en', 'te', 'hi', 'ta', 'ml', 'kn', 'bn', 'gu', 'mr', 'pa', 'or'];

  StreamSubscription? _transcriptSubscription;

  bool get isListening => _isListening;
  bool get isProcessing => _isProcessing;
  bool get isBackendConnected => _isBackendConnected;
  String get currentTranscript => _currentTranscript;
  String get detectedLanguage => _detectedLanguage;
  String get preferredLanguage => _preferredLanguage;
  bool get autoDetect => _autoDetect;
  VerseMatch? get currentVerse => _currentVerse;
  List<VerseMatch> get verseHistory =>
      List.unmodifiable(_verseHistory.reversed);
  List<TranscriptSegment> get transcriptSegments =>
      List.unmodifiable(_transcriptSegments);
  List<String> get languages => _languages;
  AudioService get audioService => _audioService;

  AppState() {
    _init();
  }

  Future<void> _init() async {
    _isBackendConnected = await ApiService.checkHealth();
    notifyListeners();
  }

  void setPreferredLanguage(String lang) {
    _preferredLanguage = lang;
    notifyListeners();
  }

  void setAutoDetect(bool value) {
    _autoDetect = value;
    notifyListeners();
  }

  void updateLanguage(String lang) {
    _detectedLanguage = lang;
    notifyListeners();
  }

  Future<void> startListening() async {
    _isListening = true;
    _currentVerse = null;
    _transcriptSegments.clear();
    notifyListeners();

    await _audioService.startListening();

    _transcriptSubscription = _audioService.transcriptStream.listen(
      (text) async {
        _currentTranscript = text;
        _transcriptSegments.add(TranscriptSegment(text: text));
        notifyListeners();

        if (text.length > 15) {
          await _processTranscript(text);
        }
      },
    );
  }

  Future<void> stopListening() async {
    _isListening = false;
    _isProcessing = false;
    await _audioService.stopListening();
    _transcriptSubscription?.cancel();
    _transcriptSubscription = null;
    notifyListeners();
  }

  Future<void> _processTranscript(String text) async {
    _isProcessing = true;
    notifyListeners();

    final lang = _autoDetect ? 'auto' : _preferredLanguage;
    final matches = await ApiService.detectVerse(text, language: lang);

    if (matches.isNotEmpty) {
      _currentVerse = matches.first;
      _verseHistory.add(matches.first);
      if (_verseHistory.length > 100) {
        _verseHistory.removeAt(0);
      }
    }

    _isProcessing = false;
    notifyListeners();
  }

  void simulateTextInput(String text) {
    _audioService.simulateTranscript(text);
  }

  @override
  void dispose() {
    _transcriptSubscription?.cancel();
    _audioService.dispose();
    super.dispose();
  }
}
