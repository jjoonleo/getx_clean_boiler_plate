import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/presentation/viewmodels/team_list_viewmodel.dart';

class TeamListPage extends StatefulWidget {
  TeamListPage({super.key});

  @override
  State<TeamListPage> createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamListViewModel>(builder: (viewmodel) {
      print(viewmodel.teamList.length);
      return Scaffold(
          appBar: AppBar(title: Text("hi")),
          body: Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: viewmodel.teamList.length,
                        itemBuilder: (context, index) {
                          
                          return Text(viewmodel.teamList[index].name);
                        }),
                  ),
                  TextButton(onPressed: viewmodel.getTeams, child: Text('get teams'))
                ],
              )));
    });
  }
}
