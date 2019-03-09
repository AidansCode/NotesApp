import 'package:flutter/material.dart';

class NoteListTile extends StatelessWidget {

  final int id;
  final ListTile listTile;

  NoteListTile({@required this.id, @required this.listTile, Key key}) : super(key: key);

  int getID() {
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return listTile;
  }

}
