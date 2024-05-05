import 'package:either_dart/src/either.dart';
import 'package:theeco/app/modules/home/repository/HomeRepository.dart';
import 'package:theeco/app/modules/home/services/HomeService.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService? _homeService;

  HomeRepositoryImpl({HomeService? homeService}) : _homeService = homeService;

  @override
  Future<List<TodosModel>> getHomeData() async {
    return _homeService!.getHomeData();
  }

  @override
  Future<Either<Failure, TodosModel>> getHomeDataTow() async {
    return _homeService!.getHomeDataTow();
  }
}
