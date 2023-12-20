import 'package:dartz/dartz.dart';
import 'package:getx_clean_boiler_plate/core/error/failure.dart';
import 'package:getx_clean_boiler_plate/feature/domain/entities/team.dart';

abstract class TeamRepository {
  Future<Either<Failure, TeamEntity>> getTeams();
}
