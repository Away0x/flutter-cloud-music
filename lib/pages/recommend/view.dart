import 'package:cloudmusic/config/app.dart';
import 'package:cloudmusic/config/theme.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppInfo.title),
        backgroundColor: AppTheme.primary,
      ),
      drawer: Container(
        color: Colors.white,
        child: const Text('drawer'),
      ),
      body: const Text('RecommendPage'),
    );
  }
}
