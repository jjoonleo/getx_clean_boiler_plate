import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/presentation/bindings/team_binding.dart';
import 'package:getx_clean_boiler_plate/feature/team/presentation/view/team_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', binding: TeamBinding(), page: () => TeamListPage()),
      ],
    );
  }
}
