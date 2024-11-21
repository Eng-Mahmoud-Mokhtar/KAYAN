import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareBottomSheet {
  void show(BuildContext context) {
    _showShareSheet(context);
  }

  void _showShareSheet(BuildContext context) {
    final String text = 'https://example.com/myapp';
    Share.share(
      text,
      subject: 'Kayan',
    );
  }
}
