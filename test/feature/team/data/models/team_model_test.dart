import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/models/team_model.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testTeamModel = TeamModel(name: "testTeamName");

  test('should be a subclass of team entity', () async {
    expect(testTeamModel, isA<TeamEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('feature/team/helpers/dummy_data/dummy_team_data.json'));

    final result = TeamModel.fromJson(jsonMap);

    expect(result, equals(testTeamModel));
  });
}
