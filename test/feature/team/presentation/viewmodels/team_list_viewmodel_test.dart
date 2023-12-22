import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/get_teams_usecase.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/riverpod.dart';
import 'package:getx_clean_boiler_plate/feature/team/presentation/viewmodels/team_list_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/provider_container.dart';
import '../../helpers/test_helper.mocks.dart';

class Listener extends Mock {
  void call(List<TeamEntity>? previous, List<TeamEntity> value);
}

void main() {
  late TeamListViewmodel teamListViewmodel;
  late GetTeamsUseCase mockGetTeamsUseCase;

  final teamEntityList = [
    TeamEntity(name: 'test1'),
    TeamEntity(name: 'test2'),
    TeamEntity(name: 'test3'),
  ];

  setUp(() {
    mockGetTeamsUseCase = MockGetTeamsUseCase();
  });
  group(
    "TeamListViewModel getModels test",
    () {
      test(
        'should provide data when getTeamsUseCase mothod returns successfuly',
        () async {
          when(mockGetTeamsUseCase.execute()).thenAnswer((_) async {
            return Right(teamEntityList);
          });
          final container = createContainer(overrides: [
            getTeamsUseCaseProvider.overrideWithValue(mockGetTeamsUseCase)
          ]);

          final listener = Listener();

          // Observe a provider and spy the changes.
          container.listen<List<TeamEntity>>(
            teamListViewmodelProvider,
            listener.call,
            fireImmediately: true,
          );

          // the listener is called immediately with empty list, the default value
          verify(listener(null, [])).called(1);
          verifyNoMoreInteractions(listener);

          await container.read(teamListViewmodelProvider.notifier).getTeams();

          // The listener was called again, but with teamEntityList this time
          verify(listener([], teamEntityList)).called(1);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}
