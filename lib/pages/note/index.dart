import 'package:flutter/material.dart';

import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/controllers/note_controller.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/widgets/note_list_tile.dart';

class NoteIndex extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NoteIndexState();
  }

}

class _NoteIndexState extends State<NoteIndex> {

  List<Note> _notes;
  List<NoteListTile> _noteListTiles;

  @override
  void initState() {
    super.initState();

    _notes = HomeControllerState.getInstance().notes;
    _noteListTiles = getNoteListTiles();
  }

  List<NoteListTile> getNoteListTiles() {
    List<NoteListTile> result = List<NoteListTile>();

    _notes.forEach((note) {
      result.add(
        NoteListTile(
          id: note.id,
          listTile: ListTile(
            leading: Icon(Icons.message),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Requesting destruction of ${note.id}...');
                  NoteController.destroy(note.id);

                  print('Removing ${note.id} from list...');
                  setState(() {
                    _noteListTiles.removeWhere((tile) => tile.getID() == note.id);
                  });
                  print('Removed ${note.id} from list!');
                }
            ),
            title: Text(note.name),
            subtitle: Text(note.note),
            onTap: () {
              NoteController.show(note.id);
            },
          ),
        )
      );
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (_notes == null || _notes.length == 0)
      return Center(
        child: Text(
          'You don\'t have any notes right now. Make one?',
          style: TextStyle(
            fontSize: 20
          ),
        ),
      );
    else
      return ListView(
        children: _noteListTiles,
      );
  }

}
