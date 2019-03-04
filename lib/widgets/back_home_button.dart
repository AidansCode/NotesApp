import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';

class BackHomeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => NoteController.index(),
    );
  }

}
