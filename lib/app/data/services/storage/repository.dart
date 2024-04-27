import 'package:getx_todo_project/app/modules/task.dart';
import 'package:getx_todo_project/app/providers/provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({
    required this.taskProvider
});
  List<Task> readTasks() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
  
}