import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_list_viewmodel.g.dart';

@riverpod
class TeamListViewmodel extends _$TeamListViewmodel {
  late final getTeamsUseCase = ref.read(getTeamsUseCaseProvider);

  @override
  List<TeamEntity> build() => [];

  Future<void> getTeams() async {
    final teams = await getTeamsUseCase.execute();
    teams.fold((l) => null, (r) {
      state = r;
    });
  }
}
