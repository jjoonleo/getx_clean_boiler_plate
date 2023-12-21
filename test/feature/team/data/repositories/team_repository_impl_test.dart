import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/core/error/exception.dart';
import 'package:getx_clean_boiler_plate/core/error/failure.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/models/team_model.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/repositories/team_repository_impl.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTeamRemoteDataSource mockTeamRemoteDataSource;
  late TeamRepositoryImpl teamRepository;

  const teamModelList = [TeamModel(name: "testTeamName")];
  const teamEntityList = [TeamEntity(name: "testTeamName")];

  setUp(() {
    mockTeamRemoteDataSource = MockTeamRemoteDataSource();
    teamRepository =
        TeamRepositoryImpl(teamRemoteDataSource: mockTeamRemoteDataSource);
  });

  group('get all teams', () {
    test('should return all teams when a call to data source is successful',
        () async {
      when(mockTeamRemoteDataSource.getTeamModels())
          .thenAnswer((_) async => teamModelList);

      final result = await teamRepository.getTeams();
      final resultEntityList = result.fold((l) => null, (r) => r);
      final bool equal = const ListEquality().equals(resultEntityList, teamEntityList);
      expect(equal, true);
      expect(resultEntityList, isA<List<TeamEntity>>());
    });

    test('should return server failure when a call to data source is unsuccessful',
        () async {
      when(mockTeamRemoteDataSource.getTeamModels())
          .thenThrow(ServerException());

      final result = await teamRepository.getTeams();
      expect(result, equals(const Left(ServerFailure('An error has occurred'))));
    });

    test('should return connection failure when the device has no internet connection',
        () async {
      when(mockTeamRemoteDataSource.getTeamModels())
          .thenThrow(const SocketException('Failed to conect to the network'));

      final result = await teamRepository.getTeams();
      expect(result, equals(const Left(ServerFailure('Failed to connect to the network'))));
    });
    
  });
}
