import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_todo_project/app/core/utils/extensions.dart';
import 'package:getx_todo_project/app/core/values/colors.dart';
import 'package:getx_todo_project/app/core/values/icons.dart';
import 'package:getx_todo_project/app/modules/home/home_controller.dart';
import 'package:getx_todo_project/app/modules/home/widgets/add_card.dart';
import 'package:getx_todo_project/app/modules/home/widgets/task_card.dart';
import 'package:getx_todo_project/app/modules/task.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.wp),
              child: Text(
                "My List",
                style:
                    TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map((element) => LongPressDraggable(
                          onDragStarted: () => controller.changeDeleting(true),
                          onDraggableCanceled: (_,__) => controller.changeDeleting(false),
                          onDragEnd: (_) => controller.changeDeleting(false),
                          feedback: Opacity(
                            opacity: 0.8,
                            child: TaskCard(task: element),
                          ),
                          child: TaskCard(task: element)))
                      .toList(),
                  AddCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
