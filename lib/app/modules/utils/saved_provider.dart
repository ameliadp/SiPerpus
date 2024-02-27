import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedProvider extends ChangeNotifier {
  final Set<String> _saveBooks = {};
  Set<String> get saveBooks => _saveBooks;

  void toogleSaved(String bookId) {
    if (_saveBooks.contains(bookId)) {
      _saveBooks.remove(bookId);
    } else {
      _saveBooks.add(bookId);
    }
    notifyListeners();
  }

  bool isExist(String bookId) {
    return _saveBooks.contains(bookId);
  }

  void clearSaved() {
    _saveBooks.clear();
    notifyListeners();
  }

  static SavedProvider of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return Provider.of<SavedProvider>(context, listen: listen);
    } else {
      return context.read<SavedProvider>();
    }
  }
}
