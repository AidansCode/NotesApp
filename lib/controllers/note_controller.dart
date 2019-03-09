import 'home_controller.dart';
import 'package:notes_app/pages/note/index.dart';
import 'package:notes_app/pages/note/show.dart';
import 'package:notes_app/pages/note/create.dart';
import 'package:notes_app/widgets/create_note_fab.dart';
import 'package:notes_app/models/note.dart';

class NoteController {

  static void index() {
    HomeControllerState.getInstance().setCurrentPage(
        NoteIndex(),
        fab: CreateNoteFAB()
    );
  }

  static void show(Note note) {
    HomeControllerState.getInstance().setCurrentPage(
      NoteShow(note),
      isHome: false
    );
  }

  static void create() {
    HomeControllerState.getInstance().setCurrentPage(
      NoteCreate(),
      isHome: false
    );
  }

  static void edit(int id, String name, String note) {
    //todo
  }

  static void destroy(int id) {
    print('Received request to destroy $id');
    HomeControllerState instance = HomeControllerState.getInstance();
    instance.databaseHelper.deleteNote(id);
    print('Deleted $id from database...');
    instance.removeNote(id);
    print('Removed $id from cache');
  }

}
