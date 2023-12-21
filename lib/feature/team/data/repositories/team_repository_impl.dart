import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:getx_clean_boiler_plate/core/error/exception.dart';
import 'package:getx_clean_boiler_plate/core/error/failure.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/team_repository.dart';

class TeamRepositoryImpl extends TeamRepository {
  final TeamRemoteDataSource teamRemoteDataSource;
  TeamRepositoryImpl({required this.teamRemoteDataSource});

  @override
  Future<Either<Failure, List<TeamEntity>>> getTeams() async {
    try {
      final result = await teamRemoteDataSource.getTeamModels();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to the network'));
    }
  }
}
