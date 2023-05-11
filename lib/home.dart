import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hive_app/get_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

class home extends StatelessWidget {
  home({super.key});

  getcontroller controller = Get.put(getcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Add New Task",
              content: Column(
                children: [
                  TextFormField(
                    controller: controller.title_controler,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  TextFormField(
                    controller: controller.subtitlr_controler,
                    decoration: InputDecoration(
                      hintText: "Sub Title",
                    ),
                  ),
                ],
              ),
              onCancel: () {
                controller.title_controler.clear();
                controller.subtitlr_controler.clear();
              },
              onConfirm: () {
                controller.add_data();
                controller.title_controler.clear();
                controller.subtitlr_controler.clear();
                Get.back();
              },
            );
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text(
          "To Do",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade300,
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.box.listenable(),
        builder: (BuildContext context, Box box, Widget? child) {
          return Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: box.length,
                itemBuilder: (BuildContext context, int index) {
                  var todo = box.getAt(index);
                  return Column(
                    children: [
                      ListTile(
                          tileColor: Colors.purple.shade100,
                          title: Text(todo.title.toString()),
                          subtitle: Text(todo.subtitle.toString()),
                          leading: Icon(
                            Icons.check_circle,
                            color: Colors.deepPurple,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                controller.data_delete(index);
                              },
                              icon: Icon(Icons.delete))),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
