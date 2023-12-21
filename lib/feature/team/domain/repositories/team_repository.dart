import 'package:dartz/dartz.dart';
import 'package:getx_clean_boiler_plate/core/error/failure.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<TeamEntity>>> getTeams();
}
