import 'package:flutter/material.dart';
import './pages/todo_page.dart';
import './pages/add.dart';

class RouterGenerator {
  static MaterialPageRoute Function(dynamic settings) route(params) {
    return (settings) {
      if (settings.name == "/add") {
        return MaterialPageRoute(
          builder: (context) {
            return Add(add_process: params['addProcess']);
          },
        );
      }

      return MaterialPageRoute(
        builder: (context) {
          return TodoPage(
              title: 'My Todo App',
              todos: params['todos'],
              delete_todo: params['deleteProcess']);
        },
      );
    };
  }
}
