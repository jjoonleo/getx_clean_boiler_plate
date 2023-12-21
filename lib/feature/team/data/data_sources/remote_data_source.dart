import 'package:getx_clean_boiler_plate/feature/team/data/models/team_model.dart';
import 'package:http/http.dart' as http;

abstract class TeamRemoteDataSource {
  Future<List<TeamModel>> getTeamModels();
}

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  final http.Client client;
  TeamRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TeamModel>> getTeamModels() {
    throw UnimplementedError(); 
  }
}
