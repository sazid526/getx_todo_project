import 'package:get/get.dart';
import 'package:getx_todo_project/app/data/services/storage/repository.dart';
import 'package:getx_todo_project/app/modules/home/home_controller.dart';
import 'package:getx_todo_project/app/providers/provider.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      taskRepository: TaskRepository(
          taskProvider: TaskProvider()
      )
    ));
  }

}