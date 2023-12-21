import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/team_repository.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/get_teams_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';


void main() {
  late TeamRepository mockTeamRepository;
  late GetTeamsUseCase getTeamsUseCase;

  setUp(() {
    mockTeamRepository = MockTeamRepository();
    getTeamsUseCase = GetTeamsUseCase(mockTeamRepository);
  });

  const testTeams = [TeamEntity(name: "testTeamName")];

  test('should get all teams from the repository', () async {
    when(mockTeamRepository.getTeams())
        .thenAnswer((_) async => const Right(testTeams));

    final result = await getTeamsUseCase.execute();

    expect(result, equals(const Right(testTeams)));
  });
}
