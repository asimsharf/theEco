import 'package:either_dart/either.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

abstract class HomeInterface {
  Future<List<TodosModel>> getHomeData();
  Future<Either<Failure, TodosModel>> getHomeDataTow();
  Future<bool> getHomeDataThree();
}
