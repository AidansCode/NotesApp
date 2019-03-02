import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';

class HomeController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeControllerState();
  }

}

class HomeControllerState extends State<HomeController> {

  static HomeControllerState instance;

  Widget _currentPage, _fab;
  bool _isHome;

  static HomeControllerState getInstance() {
    return instance;
  }

  void setCurrentPage(Widget page, {Widget fab, bool isHome = true}) {
    setState(() {
      _currentPage = page;
      _fab = fab;
      _isHome = isHome;
    });
  }

  @override
  void initState() {
    super.initState();

    instance = this;

    NoteController.index();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aidan\'s Note App'),
        leading: _isHome ? null : NoteController.getBackButton()
      ),
      body: _currentPage,
      floatingActionButton: _fab,
    );
  }

}
