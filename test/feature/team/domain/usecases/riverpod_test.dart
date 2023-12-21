import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/get_teams_usecase.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/usecases/riverpod.dart';

import '../../helpers/provider_container.dart';

void main() {
  test('[getTeamsUseCaseProvider] should provide [GetTeamsUseCase]', () {
    final container = createContainer();

    final result = container.read(getTeamsUseCaseProvider);

    expect(result, isA<GetTeamsUseCase>());
  });
}