import 'package:either_dart/src/either.dart';
import 'package:theeco/app/modules/home/todo_request_model.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

import '../interfaces/homeInterface.dart';
import '../services/HomeService.dart';

class HomeRepository implements HomeInterface {
  HomeService service = HomeService();

  HomeRepository({HomeService? service}) {
    this.service = service ?? HomeService();
  }

  @override
  Future<List<TodosModel>> getHomeData() {
    return service.getHomeData();
  }

  @override
  Future<bool> getHomeDataThree() {
    return service.getHomeDataThree();
  }

  @override
  Future<Either<Failure, List<TodosModel>>> getHomeDataTow() {
    return service.getHomeDataTow();
  }

  @override
  Future<Either<Failure, TodosModel>> postHomeData(TodoRequestModel todos) {
    if (todos.title.isEmpty) {
      return Future.value(
        Left(
          Failure(
            message: "Title is required",
            stackTrace: StackTrace.current,
          ),
        ),
      );
    }

    if (todos.description.isEmpty) {
      return Future.value(
        Left(
          Failure(
            message: "Description is required",
            stackTrace: StackTrace.current,
          ),
        ),
      );
    }

    return service.postHomeData(todos);
  }
}
