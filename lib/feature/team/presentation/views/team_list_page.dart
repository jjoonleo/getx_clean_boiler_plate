import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_clean_boiler_plate/feature/team/presentation/viewmodels/team_list_viewmodel.dart';

class TeamListPage extends ConsumerStatefulWidget {
  const TeamListPage({super.key});

  @override
  ConsumerState<TeamListPage> createState() => _TeamListPageState();
}

class _TeamListPageState extends ConsumerState<TeamListPage> {
  @override
  Widget build(BuildContext context) {
    final teamList = ref.watch(teamListViewmodelProvider);
    final viewmodel = ref.read(teamListViewmodelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('clean architecture with riverpod')),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: teamList.length,
                itemBuilder: (context, index) {
                  return Text(teamList[index].name);
                }),
          ),
          TextButton(onPressed: viewmodel.getTeams, child: const Text('get teams'))
        ],
      )),
    );
  }
}
