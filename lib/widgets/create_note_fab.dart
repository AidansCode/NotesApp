import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';

class CreateNoteFAB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Create Note',
      child: Icon(Icons.add),
      backgroundColor: Colors.teal,
      onPressed: () {
        NoteController.create();
      },
    );
  }

}
