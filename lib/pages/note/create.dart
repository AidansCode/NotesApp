import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';

class NoteCreate extends StatelessWidget {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Title of your note'
              ),
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
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
                    // submit new note

                    // return to index
                    NoteController.index();
                  },
                )
            )
          ],
        )
    );
  }

}
