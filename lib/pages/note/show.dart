import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';
import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/models/note.dart';

class NoteShow extends StatelessWidget {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Note _note;

  NoteShow(this._note);

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
            onSaved: (String value) => _note.name = value,
            initialValue: _note.name,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: 'Title of your note'
            ),
          ),
          TextFormField(
            validator: _validateNote,
            onSaved: (String value) => _note.note = value,
            initialValue: _note.note,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: 'Note',
              hintText: 'Your note'
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              color: Colors.teal,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  // update note
                  var timestamp = DateTime.now().millisecondsSinceEpoch;
                  _note.updated_at = timestamp.toString();
                  HomeControllerState.getInstance().databaseHelper.updateNote(_note);

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
