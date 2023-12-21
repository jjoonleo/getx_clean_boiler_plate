import 'package:dartz/dartz.dart';
import 'package:getx_clean_boiler_plate/core/error/failure.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/team_repository.dart';

class GetTeamsUseCase {
  final TeamRepository teamRepository;
  const GetTeamsUseCase(this.teamRepository);

  Future<Either<Failure, List<TeamEntity>>> execute() {
    return teamRepository.getTeams();
  }
}
