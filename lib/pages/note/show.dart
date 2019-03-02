import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';

class NoteShow extends StatelessWidget {

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
            initialValue: 'Note 1',
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: 'Title of your note'
            ),
          ),
          TextFormField(
            initialValue: 'This is my first note',
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
                // save note

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
