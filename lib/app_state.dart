import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedDate = '';
  String get selectedDate => _selectedDate;
  set selectedDate(String value) {
    _selectedDate = value;
  }

  List<String> _selectedDateAnswers = [];
  List<String> get selectedDateAnswers => _selectedDateAnswers;
  set selectedDateAnswers(List<String> value) {
    _selectedDateAnswers = value;
  }

  void addToSelectedDateAnswers(String value) {
    _selectedDateAnswers.add(value);
  }

  void removeFromSelectedDateAnswers(String value) {
    _selectedDateAnswers.remove(value);
  }

  void removeAtIndexFromSelectedDateAnswers(int index) {
    _selectedDateAnswers.removeAt(index);
  }

  void updateSelectedDateAnswersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _selectedDateAnswers[index] = updateFn(_selectedDateAnswers[index]);
  }

  void insertAtIndexInSelectedDateAnswers(int index, String value) {
    _selectedDateAnswers.insert(index, value);
  }
}
