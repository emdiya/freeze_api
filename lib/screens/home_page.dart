import 'package:flutter/material.dart';
import 'package:freeze_api/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userCon = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Obx(
        () => userCon.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: Colors.blue.shade800,
                  size: 24,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: userCon.userList
                      .map(
                        (element) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              '${element.id}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          title: Text(element.name ?? '',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueGrey)),
                          subtitle: Text(element.email ?? ''),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            const Text('Another data');
                          },
                          onLongPress: () {
                            const Text('Data');
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userCon.fetchData();
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
