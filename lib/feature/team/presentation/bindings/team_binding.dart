import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/controller.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/repositories/controller.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/controller.dart';
import 'package:getx_clean_boiler_plate/feature/team/presentation/viewmodels/team_list_viewmodel.dart';
import 'package:http/http.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeamRemoteDataSourceController(client: Client()));
    TeamRemoteDataSourceController teamRemoteDataSourceController = Get.find();
    Get.put(TeamRepositoryController(
        teamRemoteDataSource:
            teamRemoteDataSourceController.teamRemoteDataSource));

    TeamRepositoryController teamRepositoryController = Get.find();
    Get.put(GetTeamsUseCaseController(
        teamRepository: teamRepositoryController.teamRepository));

    Get.put(TeamListViewModel());
  }
}
