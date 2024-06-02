import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:theeco/app/modules/home/controllers/home_controller.dart';
import 'package:theeco/app/modules/home/interfaces/homeInterface.dart';
import 'package:theeco/app/modules/home/models/todo_request_model.dart';
import 'package:theeco/app/modules/home/models/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

import 'main.mocks.dart';
import 'response/todos_response.dart';

@GenerateMocks([HomeInterface])
void main() {
  late HomeController homeController;
  late MockHomeInterface mockHomeInterface;

  setUp(() {
    mockHomeInterface = MockHomeInterface();
    homeController = HomeController(homeInterface: mockHomeInterface);
  });

  group('HomeController Tests', () {
    test('getHomeData should load data successfully', () async {
      // Arrange
      when(mockHomeInterface.getHomeData()).thenAnswer(
        (_) async => TodosModel.fromJsonList(todosResponse),
      );

      // Act
      await homeController.getHomeData();

      // Assert
      expect(homeController.isLoading.value, false);
      expect(homeController.todos.isNotEmpty, true);

      // Compare
      assert(homeController.todos.length == todosResponse.length);
      assert(homeController.todos.first.id == todosResponse.first['id']);
    });

    test('getHomeData should handle error', () async {
      // Arrange
      when(mockHomeInterface.getHomeData()).thenThrow(
        Exception('Failed to load data'),
      );

      // Act
      await homeController.getHomeData();

      // Assert
      expect(homeController.isLoading.value, false);
    });

    test('getHomeDataTow should load data successfully', () async {
      // Arrange
      when(mockHomeInterface.getHomeDataTow()).thenAnswer(
        (_) async => Right(TodosModel.fromJsonList(todosResponse)),
      );

      // Act
      await homeController.getHomeDataTow();

      // Assert
      expect(homeController.todos.isNotEmpty, true);
      expect(homeController.isLoading.value, false);
    });

    test('getHomeDataTow should handle 401 error', () async {
      // Arrange
      final failure = Failure(
        stackTrace: StackTrace.current,
        message: 'Unauthorized',
      );
      when(mockHomeInterface.getHomeDataTow()).thenAnswer(
        (_) async => Left(failure),
      );

      // Act
      await homeController.getHomeDataTow();

      // Assert
      expect(homeController.isLoading.value, false);
      verify(mockHomeInterface.getHomeDataTow()).called(1);
    });

    test('postHomeData should add todo successfully', () async {
      // Arrange
      final todoRequestModel = TodoRequestModel(
        title: 'New Todo',
        description: 'New Todo Description',
        userId: 1,
        completed: false,
      );
      final todoModel = TodosModel(
        id: 1,
        title: 'New Todo',
        completed: false,
        userId: 1,
      );
      when(mockHomeInterface.postHomeData(todoRequestModel)).thenAnswer(
        (_) async => Right(todoModel),
      );

      // Act
      await homeController.postHomeData(todoRequestModel);

      // Assert
      expect(homeController.todos.contains(todoModel), true);
      expect(homeController.isLoading.value, false);
      verify(mockHomeInterface.postHomeData(todoRequestModel)).called(1);
    });

    test('postHomeData should handle error', () async {
      // Arrange
      final todoRequestModel = TodoRequestModel(
        title: 'New Todo',
        description: 'New Todo Description',
        userId: 1,
        completed: false,
      );
      final failure = Failure(
        stackTrace: StackTrace.current,
        message: 'Failed to add todo',
      );
      when(mockHomeInterface.postHomeData(todoRequestModel)).thenAnswer(
        (_) async => Left(failure),
      );

      // Act
      await homeController.postHomeData(todoRequestModel);

      // Assert
      expect(homeController.isLoading.value, false);
      verify(mockHomeInterface.postHomeData(todoRequestModel)).called(1);
    });

    test('updateTodo should update todo successfully', () async {
      // Arrange
      final initialTodo = TodosModel(
        id: 1,
        title: 'Initial Todo',
        completed: false,
        userId: 1,
      );
      homeController.todos.add(initialTodo);
      final updatedTodo = initialTodo.copyWith(title: 'Updated Todo');

      // Act
      await homeController.updateTodo(updatedTodo);

      // Assert
      expect(homeController.todos.first.title, 'Updated Todo');
    });
  });
}
