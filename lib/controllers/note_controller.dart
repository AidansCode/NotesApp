import 'home_controller.dart';
import 'package:notes_app/pages/note/index.dart';
import 'package:notes_app/pages/note/show.dart';
import 'package:notes_app/pages/note/create.dart';
import 'package:notes_app/widgets/create_note_fab.dart';

class NoteController {

  static void index() {
    HomeControllerState.getInstance().setCurrentPage(
        NoteIndex(),
        fab: CreateNoteFAB()
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
