import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'package:notes_app/pages/note/index.dart';
import 'package:notes_app/pages/note/show.dart';
import 'package:notes_app/pages/note/create.dart';

class NoteController {

  static Widget getCreateFAB() {
    return FloatingActionButton(
      tooltip: 'Create Note',
      child: Icon(Icons.add),
      backgroundColor: Colors.teal,
      onPressed: () {
        NoteController.create();
      },
    );
  }

  static Widget getBackButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => index(),
    );
  }

  static void index() {
    HomeControllerState.getInstance().setCurrentPage(
        NoteIndex(),
        fab: getCreateFAB()
    );
  }

  static void show(int index) {
    HomeControllerState.getInstance().setCurrentPage(
      NoteShow(),
      isHome: false
    );
  }

  static void create() {
    HomeControllerState.getInstance().setCurrentPage(
      NoteCreate(),
      isHome: false
    );
  }

  static void edit(int index, String name, String note) {
    //todo
  }

  static void destroy(int index) {
    //todo
  }

}
