import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo_project/app/core/utils/keys.dart';
import 'package:getx_todo_project/app/data/services/storage/services.dart';
import 'package:getx_todo_project/app/modules/task.dart';

class TaskProvider {
 final StorageService _storage = Get.find<StorageService>();

  List<Task> readTasks(){
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks){
    _storage.write(taskKey, jsonEncode(tasks));
  }
}