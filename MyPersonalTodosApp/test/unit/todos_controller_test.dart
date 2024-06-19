import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:object_box/domain/entities/todo.dart';
import 'package:object_box/infrastructure/repositories/todo_repository.dart';
import 'package:object_box/presentation/controllers/todo_controller.dart';

import 'package:flutter_test/flutter_test.dart';

import 'todos_controller_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoRepository todoRepository;
  late TodoController todoController;

  setUp(() {
    todoRepository = MockTodoRepository();
    todoController = TodoController(todoRepository);
  });

  group("Testing todos controller", () {
    test("Should load all created todos", () async {
      //Arrange
      final todos = [
        Todo(id: 1, name: "Todo 1", body: "Corpo do todo 1", done: false),
        Todo(id: 2, name: "Todo 2", body: "Corpo do todo 2", done: true)
      ];

      when(todoRepository.get()).thenAnswer((_) => Future.value(todos));

      expect(todoController.isLoading, false);
      expect(todoController.todos, isEmpty);

      //Act
      await todoController.getTodos();

      //Assert
      verify(todoRepository.get()).called(1);

      expect(todoController.todos, isNotEmpty);

      expect(todoController.todos, todos);
    });

    test("Should create a todo", () async {
      //arrange
      final newTodo = Todo(
        id: 1,
        name: "created todo",
        body: "body created todo",
        done: true,
      );

      when(todoRepository.save(any)).thenAnswer((_) => Future.value(newTodo));

      //act
      await todoController.create(
        todo: newTodo,
      );

      //assert
      expect(todoController.todos, contains(newTodo));
    });
  });

  test("Should update an existing todo", () async {
    final todos = [
      Todo(id: 1, name: "Todo 1", body: "Corpo do todo 1", done: false),
    ];

    when(todoRepository.get()).thenAnswer((_) => Future.value(todos));

    Todo updatedTodo = List<Todo>.from(todos).first.copyWith(done: true);

    when(todoRepository.save(any)).thenAnswer((_) => Future.value(updatedTodo));

    await todoController.getTodos();

    await todoController.setTodoDone(todos.first, true);

    expect(todoController.todos.first, todos.first);
  });

  test("Should delete an existing todo", () async {
    final todos = [
      Todo(id: 1, name: "Todo 1", body: "Corpo do todo 1", done: false),
    ];

    when(todoRepository.get()).thenAnswer((_) => Future.value(todos));

    Todo updatedTodo = List<Todo>.from(todos).first.copyWith(done: true);

    when(todoRepository.delete(any)).thenAnswer((_) => Future.value());

    await todoController.getTodos();

    await todoController.removeTodo(todos.first);

    expect(todoController.todos, isEmpty);
  });
}
