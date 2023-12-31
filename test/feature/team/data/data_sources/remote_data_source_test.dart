import 'package:flutter_test/flutter_test.dart';
import 'package:getx_clean_boiler_plate/core/constants/constants.dart';
import 'package:getx_clean_boiler_plate/core/error/exception.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/models/team_model.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late TeamRemoteDataSource teamRemoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    teamRemoteDataSource = TeamRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get all teams', () {
    test('should return all team models when the response code is 200', () async {
      when(
        mockHttpClient.get(Uri.parse(Urls.allTeams))
      ).thenAnswer((_) async =>
        http.Response(
            readJson('feature/team/helpers/dummy_data/dummy_teams_data.json'),
            200
          )
        );

      final result = await teamRemoteDataSource.getTeamModels();

      expect(result, isA<List<TeamModel>>());
    });

    test('should return a server exception when the response is 404 or other', () async {
      when(
        mockHttpClient.get(Uri.parse(Urls.allTeams))
      ).thenAnswer((_) async =>
        http.Response(
            'Not found',
            404
          )
        );

      expect(() async => await teamRemoteDataSource.getTeamModels(), throwsA(isA<ServerException>()));
      

      
    });
    
  });
  
}
