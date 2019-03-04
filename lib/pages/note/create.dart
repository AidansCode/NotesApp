import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';
import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/models/note.dart';

class NoteCreate extends StatelessWidget {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name, _note;

  String _validateName(String value) {
    if (value.length == 0) {
      return "You must enter a name!";
    }

    return null;
  }

  String _validateNote(String value) {
    if (value.length == 0) {
      return "You must enter a note!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            TextFormField(
              validator: _validateName,
              onSaved: (String value) => _name = value,
              decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Title of your note'
              ),
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              validator: _validateNote,
              onSaved: (String value) => _note = value,
              decoration: InputDecoration(
                  labelText: 'Note',
                  hintText: 'Your note'
              ),
            ),
            Center(
                child: RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      // submit new note
                      var timestamp = DateTime.now().toLocal().toString();
                      Note note = Note(_name, _note, timestamp, timestamp);

                      Future<int> futureId = HomeControllerState.getInstance().databaseHelper.insertNote(note);
                      futureId.then((id) {
                        note.id = id;
                      });
                      HomeControllerState.getInstance().addNote(note);

                      // return to index
                      NoteController.index();
                    }
                  },
                )
            )
          ],
        )
    );
  }

}
