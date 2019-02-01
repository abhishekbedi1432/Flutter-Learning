import 'package:flutter/material.dart';
import 'package:myapp/Todo.dart';

class TodoListScreen extends StatelessWidget {
  final List<Todo> todos;

  TodoListScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final Todo todo = todos[index];

          final MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => TodoDetailScreen(todo: todo));

          return ListTile(
            title: Text(todos[index].title),
            // When a user taps on the ListTile, navigate to the DetailScreen.
            // Notice that we're not only creating a DetailScreen, we're
            // also passing the current to-do through to it!
            onTap: () {
              Navigator.push(context, route);
            },
          );
        },
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  const TodoDetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${todo.title}')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}
