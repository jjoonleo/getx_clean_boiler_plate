import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/repositories/team_repository_impl.dart';

class TeamRepositoryController extends GetxController {
  late TeamRepositoryImpl teamRepository;
  TeamRemoteDataSource teamRemoteDataSource;

  TeamRepositoryController({required this.teamRemoteDataSource}):
  teamRepository = TeamRepositoryImpl(teamRemoteDataSource: teamRemoteDataSource);
}
