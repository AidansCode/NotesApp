import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/database_helper.dart';
import 'package:notes_app/widgets/back_home_button.dart';

class HomeController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeControllerState();
  }

}

class HomeControllerState extends State<HomeController> {

  static HomeControllerState instance;
  List<Note> _notes;
  DatabaseHelper _databaseHelper;

  Widget _currentPage, _fab;
  bool _isHome;

  List<Note> get notes => _notes;
  DatabaseHelper get databaseHelper => _databaseHelper;

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

  void addNote(Note note) {
    _notes.add(note);
  }

  void removeNote(int id) {
    setState(() {
      _notes.removeWhere((note) => note.id == id);
    });
  }

  @override
  void initState() {
    super.initState();

    instance = this;
    _databaseHelper = DatabaseHelper();
    Future<List<Note>> futureNotes = _databaseHelper.getNotesList();
    futureNotes.then((noteList) {
      _notes = noteList;
      NoteController.index();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aidan\'s Note App'),
        leading: _isHome == null || _isHome == true ? null : BackHomeButton()
      ),
      body: _currentPage,
      floatingActionButton: _fab,
    );
  }

}
