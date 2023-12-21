import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/riverpod.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/repositories/team_repository_impl.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/team_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
TeamRepository teamRepository(
  TeamRepositoryRef ref,
) {
  final teamRemoteDataSource = ref.read(teamRemoteDataSourceProvider);
  final TeamRepository teamRepository =
      TeamRepositoryImpl(teamRemoteDataSource: teamRemoteDataSource);
  return teamRepository;
}
