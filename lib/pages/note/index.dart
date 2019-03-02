import 'package:flutter/material.dart';

import 'package:notes_app/controllers/note_controller.dart';

class NoteIndex extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NoteIndexState();
  }

}

class _NoteIndexState extends State<NoteIndex> {

  Map<String, String> notes = {
    "Note 1": "This is my first note",
    "Note 2": "This is my second note",
    "Note 3": "This is my third note"
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.message),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  NoteController.destroy(index);
                }
            ),
            title: Text(notes.keys.elementAt(index)),
            subtitle: Text(notes.values.elementAt(index)),
            onTap: () {
              NoteController.show(index);
            },
          );
        }
    );
  }

}
