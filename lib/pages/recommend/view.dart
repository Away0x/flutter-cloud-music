import 'package:cloudmusic/config/app.dart';
import 'package:cloudmusic/config/theme.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppInfo.title),
        backgroundColor: AppTheme.primary,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Text('推荐'),
            Text('歌手'),
            Text('排行榜'),
          ],
        ),
      ),
      drawer: const Drawer(
        child: Text('drawer'),
      ),
      body: const Text('RecommendPage'),
    );
  }
}
