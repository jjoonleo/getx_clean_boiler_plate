import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:getx_clean_boiler_plate/feature/team/domain/repositories/team_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    TeamRepository,
    TeamRemoteDataSource
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main() {

}
