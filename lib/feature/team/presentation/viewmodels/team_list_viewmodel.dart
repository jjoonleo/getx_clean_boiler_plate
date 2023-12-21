import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/controller.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/get_teams_usecase.dart';

class TeamListViewModel extends GetxController {
  List<TeamEntity> teamList = <TeamEntity>[TeamEntity(name: "name")];
  final GetTeamsUseCase getTeamsUseCase =
      Get.find<GetTeamsUseCaseController>().getTeamsUseCase;

  @override
  void onInit() async {
    //await getTeams();
    super.onInit();
  }

  Future<void> getTeams() async {
    final teams = await getTeamsUseCase.execute();
    teams.fold((l) => null, (r) {
      teamList = r;
      update();
      print(teamList);
    });
  }
}
