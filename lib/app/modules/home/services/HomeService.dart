import 'package:either_dart/src/either.dart';
import 'package:theeco/app/modules/home/models/todo_request_model.dart';
import 'package:theeco/app/modules/home/models/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';
import 'package:theeco/app/shared/utilities/thePrettyJson.dart';
import 'package:theeco/app/shared/utilities/the_dio.dart';

import '../interfaces/homeInterface.dart';

class HomeService implements HomeInterface {
  @override
  Future<List<TodosModel>> getHomeData() async {
    try {
      final response = await TheDio.instance.get('todos');
      if (response.statusCode! >= 400) {
        return Future.error(response.statusMessage!);
      } else {
        return response.data
            .map<TodosModel>((e) => TodosModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<Either<Failure, List<TodosModel>>> getHomeDataTow() {
    try {
      final response = TheDio.instance.get('todos');
      return response.then(
        (value) {
          if (value.statusCode! >= 400) {
            return Left(
              Failure(
                message: "${value.statusMessage!} ${value.statusCode}",
                stackTrace: StackTrace.current,
              ),
            );
          } else if (value.statusCode == 401) {
            return Left(
              NotFoundFailure(
                message: "${value.statusMessage!} ${value.statusCode}",
                stackTrace: StackTrace.current,
                errorCode: value.statusCode,
              ),
            );
          } else {
            return Right(
              value.data
                  .map<TodosModel>((e) => TodosModel.fromJson(e))
                  .toList(),
            );
          }
        },
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<bool> getHomeDataThree() {
    try {
      return Future.value(true);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<Either<Failure, TodosModel>> postHomeData(TodoRequestModel todos) {
    try {
      return TheDio.instance.post('todos', data: todos.toJson()).then(
        (value) {
          ThePrettyJson.prettyPrintJsonDynamic(value.data);
          if (value.statusCode! >= 400) {
            return Left(
              Failure(
                message: "${value.statusMessage!} ${value.statusCode}",
                stackTrace: StackTrace.current,
              ),
            );
          } else {
            return Right(TodosModel.fromJson(value.data));
          }
        },
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
