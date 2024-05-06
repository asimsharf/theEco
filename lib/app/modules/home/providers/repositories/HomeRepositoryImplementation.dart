import 'package:either_dart/src/either.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

import '../interfaces/homeInterface.dart';

class HomeRepositoryImplementation implements HomeInterface {
  final HomeInterface? _homeService;

  HomeRepositoryImplementation({HomeInterface? homeService})
      : _homeService = homeService;

  @override
  Future<List<TodosModel>> getHomeData() async {
    return await _homeService!.getHomeData();
  }

  @override
  Future<Either<Failure, TodosModel>> getHomeDataTow() async {
    return await _homeService!.getHomeDataTow();
  }

  @override
  Future<bool> getHomeDataThree() {
    // TODO: implement getHomeDataThree
    throw UnimplementedError();
  }
}
