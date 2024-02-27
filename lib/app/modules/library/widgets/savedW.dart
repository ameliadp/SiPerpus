import 'package:digitallibrary/app/modules/library/views/library_view.dart';
import 'package:digitallibrary/app/modules/utils/saved_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedLibrary extends StatelessWidget {
  const SavedLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SavedProvider(),
    builder: (context, child) => LibraryView(),);
  }
}
