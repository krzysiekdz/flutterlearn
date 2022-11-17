import 'package:flutter/material.dart';

import '../../../utils/ListState.dart';
import '../../../utils/Repo.dart';
import '../../models/Todo.dart';


class TodosList extends StatefulWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  State<TodosList> createState() => TodosListState();
}

class TodosListState extends ListState<TodosList, Todo> {

  @override
  Repo<Todo> createRepo() => TodosRepo();
  

  @override
  Widget buildListElement(Todo? item, BuildContext context, int i) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(item?.id.toString() ?? '0'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      title: Text(item?.title ?? 'NO TITLE'),
      subtitle: Text(item?.date.toString() ?? 'NO DATE'),
    );
  }

}

class TodosRepo extends Repo<Todo> {

  String get endPoint => 'api/todos';

  @override
  Todo fromJson(Map<String, dynamic> item) => Todo.fromJson(item);

}