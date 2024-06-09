import 'package:change_notifier_provider/models/todo.dart';
import 'package:faker/faker.dart';

List<Todo> generateFakeTodoList({
  required int numberOfTodos,
}) {
  List<Todo> fakeTodoList = [];
  for (int i = 0; i < numberOfTodos; i++) {
    fakeTodoList.add(
      Todo(
        id: i,
        name: Faker().lorem.sentences(5).toString(),
        completed: i % 3 == 0,
      ),
    );
  }

  return fakeTodoList;
}
