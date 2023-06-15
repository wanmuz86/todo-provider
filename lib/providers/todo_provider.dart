import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';
import 'dart:convert';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];
  List<Todo> urgentTodos = [];
  SharedPreferences? _prefs;

  TodoProvider() {
    _loadTodos();
  }

  void _loadTodos() async {
    _prefs = await SharedPreferences.getInstance();
    final todoListJson = _prefs!.getString('todos');
    if (todoListJson != null) {
      final decodedList = jsonDecode(todoListJson) as List<dynamic>;
      todos = decodedList.map((json) => Todo.fromJson(json)).toList();
    }
    final urgentListJson = _prefs!.getString('urgents');
    if (urgentListJson != null) {
      final decodedList = jsonDecode(urgentListJson) as List<dynamic>;
      urgentTodos = decodedList.map((json) => Todo.fromJson(json)).toList();
    }
    notifyListeners();
  }

  void _saveTodos() {
    final todoListJson = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    _prefs!.setString('todos', todoListJson);
    final urgentListTodo = jsonEncode(urgentTodos.map((todo) => todo.toJson()).toList());
    _prefs!.setString('urgents', urgentListTodo);

  }

  void addTodo(
     String name,
     String place,
     String description,
  ) {
    final todo = Todo(
      name: name,
      place: place,
      description: description,
    );
    todos.add(todo);
    _saveTodos();
    notifyListeners();
  }

  void addUrgentTodo(todo){
    urgentTodos.add(todo);
    _saveTodos();
    notifyListeners();
  }
  void removeUrgentTodo(todo){
    urgentTodos.remove(todo);
    _saveTodos();
    notifyListeners();
  }
}

