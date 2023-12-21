import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/repositories/team_repository_impl.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/get_teams_usecase.dart';

class GetTeamsUseCaseController extends GetxController {
  final TeamRepositoryImpl teamRepository;
  late GetTeamsUseCase getTeamsUseCase;
  GetTeamsUseCaseController({required this.teamRepository})
      : getTeamsUseCase = GetTeamsUseCase(teamRepository);
}
