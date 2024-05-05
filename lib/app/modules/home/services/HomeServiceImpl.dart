import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:theeco/app/modules/home/services/HomeService.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/errors/failure.dart';

class HomeServiceImpl implements HomeService {
  final Dio dio;

  HomeServiceImpl(this.dio);

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<TodosModel>> getHomeData() async {
    try {
      return await dio.get(_baseUrl).then(
        (response) {
          if (response.statusCode == 200) {
            return TodosModel.fromJsonList(response.data);
          } else if (response.statusCode == 401) {
            throw UnAuthorizedFailure(
              message: 'Unauthorized access to data',
              stackTrace: StackTrace.current,
              errorCode: response.statusCode,
            );
          } else if (response.statusCode == 404) {
            throw NotFoundFailure(
              message: 'Data not found',
              stackTrace: StackTrace.current,
              errorCode: response.statusCode,
            );
          } else {
            throw Failure(
              message: 'Failed to load data: ${response.statusCode}',
              stackTrace: StackTrace.current,
            );
          }
        },
      );
    } catch (e) {
      throw CacheFailure(
        message: 'Failed to load data: $e',
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<Either<Failure, TodosModel>> getHomeDataTow() async {
    try {
      return await dio.get(_baseUrl).then(
        (response) {
          if (response.statusCode == 200) {
            return Right(TodosModel.fromJson(response.data));
          } else if (response.statusCode == 401) {
            return Left(
              UnAuthorizedFailure(
                message: 'Unauthorized access to data',
                stackTrace: StackTrace.current,
                errorCode: response.statusCode,
              ),
            );
          } else if (response.statusCode == 404) {
            return Left(
              NotFoundFailure(
                message: 'Data not found',
                stackTrace: StackTrace.current,
                errorCode: response.statusCode,
              ),
            );
          } else {
            return Left(
              Failure(
                message: 'Failed to load data: ${response.statusCode}',
                stackTrace: StackTrace.current,
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        CacheFailure(
          message: 'Failed to load data: $e',
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
