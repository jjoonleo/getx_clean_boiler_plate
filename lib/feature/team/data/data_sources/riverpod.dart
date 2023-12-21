import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'riverpod.g.dart';

@riverpod
TeamRemoteDataSource teamRemoteDataSource(TeamRemoteDataSourceRef ref) {
  final TeamRemoteDataSource teamRemoteDataSource =
      TeamRemoteDataSourceImpl(client: http.Client());
  return teamRemoteDataSource;
}
