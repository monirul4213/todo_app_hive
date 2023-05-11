import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/data_model.dart';

class getcontroller extends GetxController {
  late Box box;
  TextEditingController title_controler = TextEditingController();
  TextEditingController subtitlr_controler = TextEditingController();

  @override
  void onInit() {
    box = Hive.box("DB");
    // TODO: implement onInit
    super.onInit();
  }

  add_data() {
    final data = dataModel(
        title: title_controler.text, subtitle: subtitlr_controler.text);
    box.add(data);
  }

  get_data() {
    var data = box.get("name");
    print(data);
  }

  data_delete(index) {
    box.deleteAt(index);
  }

  data_update() {
    box.put('name', "Updated");
  }
}
