import 'package:either_dart/either.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

import '../todo_request_model.dart';

abstract class HomeInterface {
  Future<List<TodosModel>> getHomeData();
  Future<Either<Failure, List<TodosModel>>> getHomeDataTow();
  Future<bool> getHomeDataThree();
  Future<Either<Failure, TodosModel>> postHomeData(TodoRequestModel todos);
}
