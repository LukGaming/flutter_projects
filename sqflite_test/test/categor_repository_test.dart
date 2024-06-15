import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_test/category.dart';
import 'package:sqflite_test/dependencies/locator.dart';
import 'package:sqflite_test/infrastructure/repositories/category_repository.dart';

void main() async {
  late ICategoryRepository categoryRepository;
  late Database db;

  setUp(() async {
    await locator();
    db = GetIt.instance<Database>();

    categoryRepository = GetIt.instance<ICategoryRepository>();
  });

  tearDown(() {
    db.close();
    GetIt.instance.reset(dispose: true);
  });

  test("should create a category", () async {
    //Arrange
    String categoryName = "Primeira categoria";
    final Category firstCategory = Category(name: categoryName);

    //Act
    final createdCategory = await categoryRepository.create(firstCategory);

    //Assert

    expect(createdCategory.id, 1);
    expect(createdCategory.name, categoryName);
  });

  test("should update a category", () async {
    //arrange
    String categoryName = "Primeira categoria";
    final Category firstCategory = Category(name: categoryName);

    //Act
    final createdCategory = await categoryRepository.create(firstCategory);

    //Assert

    expect(createdCategory.id, 1);
    expect(createdCategory.name, categoryName);

    //arrange
    String nomeAtualizado = "Nome atualizado";
    final categoryToUpdate = createdCategory.copyWith(name: nomeAtualizado);

    //act

    final Category updatedCategory =
        await categoryRepository.update(categoryToUpdate);

    //assert

    expect(updatedCategory.id, 1);

    expect(updatedCategory.name, nomeAtualizado);
  });
}
