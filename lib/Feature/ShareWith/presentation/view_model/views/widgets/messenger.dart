import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Button Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SharePage(),
    );
  }
}

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Button Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showShareSheet(context);
          },
          child: Text('شارك'),
        ),
      ),
    );
  }

  void _showShareSheet(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final String text = 'https://example.com/myapp';
    Share.share(text,
        subject: 'Kayan',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
