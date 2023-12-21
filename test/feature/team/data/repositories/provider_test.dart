import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/riverpod.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/team_repository.dart';

import '../../helpers/provider_container.dart';

void main() {
  test('[teamRepositoryProvider] should provide [TeamRepository]', () {
    final container = createContainer();

    final result = container.read(teamRepositoryProvider);

    expect(result, isA<TeamRepository>());
  });
}