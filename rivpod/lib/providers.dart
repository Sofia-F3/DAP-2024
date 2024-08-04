import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameListProvider =
    StateNotifierProvider<NameListNotifier, List<String>>((ref) {
  return NameListNotifier();
});

class NameListNotifier extends StateNotifier<List<String>> {
  NameListNotifier()
      : super([
          'Juan',
        ]);

  void addName(String name) {
    state = [...state, name];
  }

  void editName(int index, String newName) {
    final updatedList = [...state];
    updatedList[index] = newName;
    state = updatedList;
  }

  void deleteName(int index) {
    final updatedList = [...state]..removeAt(index);
    state = updatedList;
  }
}
