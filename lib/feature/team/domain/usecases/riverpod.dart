import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/riverpod.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/get_teams_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
GetTeamsUseCase getTeamsUseCase(GetTeamsUseCaseRef ref) {
  final teamRepository = ref.read(teamRepositoryProvider);
  final GetTeamsUseCase getTeamsUseCase = GetTeamsUseCase(teamRepository);
  return getTeamsUseCase;
}
