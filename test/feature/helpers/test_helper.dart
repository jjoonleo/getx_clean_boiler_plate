import 'package:getx_clean_boiler_plate/feature/domain/repositories/team_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    TeamRepository
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main() {

}
