import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/riverpod.dart';

import '../../helpers/provider_container.dart';

void main() {
  test('[teamRemoteDataSourceProvider] should provide [TeamRemoteDataSource]', () {
    final container = createContainer();

    final result = container.read(teamRemoteDataSourceProvider);

    expect(result, isA<TeamRemoteDataSource>());
  });
}
