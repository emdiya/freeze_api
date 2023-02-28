import 'package:flutter/material.dart';
import 'package:freeze_api/helper/api_base_helper.dart';
import 'package:get/get.dart';

import '../models/userModel/user_model.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  final userList = <UserModel>[].obs;
  final userModel = UserModel().obs;
  final isLoading = false.obs;
  Future<List<UserModel>> fetchData() async {
    isLoading(true);
    final userLists = <UserModel>[];
    final apihelper = ApiBaseHelper();
    await apihelper
        .onNetworkRequesting(
            url: 'users', methode: METHODE.get, isAuthorize: false)
        .then((respone) {
      respone.map((e) {
        final data = UserModel.fromJson(e);
        userLists.add(data);
      }).toList();
      userList.value = userLists;
      debugPrint('----------------- Respone $respone');
    }).onError((ErrorModel error, _) {
      debugPrint('---------- Fetch User Model Error : ${error.bodyString}');
    });
    isLoading(false);
    return userList;
  }
}
