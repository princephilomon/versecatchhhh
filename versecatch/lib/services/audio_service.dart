import 'dart:async';

class AudioService {
  bool _isListening = false;
  final _textController = StreamController<String>.broadcast();

  Stream<String> get transcriptStream => _textController.stream;
  bool get isListening => _isListening;

  Future<bool> requestPermission() async {
    return true;
  }

  Future<void> startListening() async {
    _isListening = true;
  }

  Future<void> stopListening() async {
    _isListening = false;
  }

  void simulateTranscript(String text) {
    if (_isListening) {
      _textController.add(text);
    }
  }

  void dispose() {
    _textController.close();
  }
}
