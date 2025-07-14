
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget  {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {

  final List<Widget> _tabViewWidgetsList = [
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
    Container(color: Colors.green,),
  ];

  final List<Widget> _tabsList = [
    Tab(child: Text("Chat")),
    Tab(child: Text("Status")),
    Tab(child: Text("Calls")),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print("Tab changed to: ${_tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: _tabViewWidgetsList.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tab Screen'),
              bottom: TabBar(
                isScrollable: false,
                tabs: _tabsList,
                controller: _tabController,
              ),
            ),
            body: TabBarView(controller: _tabController,children: _tabViewWidgetsList,),
          ),
        )
    );
  }
}