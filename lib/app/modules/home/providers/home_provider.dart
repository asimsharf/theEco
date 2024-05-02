import 'package:get/get.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/utilities/the_api_failure_response.dart';
import 'package:theeco/app/shared/utilities/the_api_success_response.dart';
import 'package:theeco/app/shared/utilities/the_dio.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    TheDio.instance.dioHeaders();
    super.onInit();
  }

  @override
  void onReady() {
    TheDio.instance.dioInterceptors();
    fetchData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    TheDio.instance.dio.interceptors.clear();
  }

  Future<TheApiSuccessResponse> fetchData() async {
    try {
      final todosList = List<TodosModel>.empty(growable: true).obs;
      await TheDio.instance
          .get('https://jsonplaceholder.typicode.com/todos')
          .then(
        (response) {
          for (var item in response.data) {
            todosList.add(TodosModel.fromJson(item));
          }
        },
      );

      return TheApiSuccessResponse(
        data: todosList,
        message: 'Success',
        code: 200,
        status: true,
      );
    } catch (error) {
      throw TheApiFailureResponse(
        message: error.toString(),
        code: 500,
        status: false,
      );
    }
  }
}
