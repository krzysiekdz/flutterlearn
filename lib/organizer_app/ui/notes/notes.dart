import 'package:flutter/material.dart';

import '../../../utils/ListState.dart';
import '../../../utils/Repo.dart';
import '../../models/Note.dart';


class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  State<NotesList> createState() => NotesListState();
}

class NotesListState extends ListState<NotesList, Note> {

  @override
  Repo<Note> createRepo() => NotesRepo();


  @override
  Widget buildListElement(Note? item, BuildContext context, int i) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(item?.id.toString() ?? '0'),
        backgroundColor: Colors.green,
      ),
      title: Text(item?.text ?? 'NO TEXT'),
      subtitle: Text('no subtitle'),
    );
  }

}

class NotesRepo extends Repo<Note> {

  String get endPoint => 'api/articles';

  @override
  Note fromJson(Map<String, dynamic> item) => Note.fromJson(item);

}