import 'utils.dart';
import 'package:flutter/material.dart';

class DownloadProgressDialog extends StatelessWidget {
  final DownloadProgress downloadProgress;
  const DownloadProgressDialog({super.key, required this.downloadProgress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(
            "Downloading",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        LinearProgressIndicator(
          value: downloadProgress.progress,
          backgroundColor: Colors.grey,
          color: Colors.green,
          minHeight: 10,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "${downloadProgress.percentage} %",
          ),
        )
      ],
    ));
  }
}
