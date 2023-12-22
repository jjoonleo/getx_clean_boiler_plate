import 'dart:convert';

import 'package:getx_clean_boiler_plate/core/constants/constants.dart';
import 'package:getx_clean_boiler_plate/core/error/exception.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/models/team_model.dart';
import 'package:http/http.dart' as http;

abstract class TeamRemoteDataSource {
  Future<List<TeamModel>> getTeamModels();
}

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  final http.Client client;
  TeamRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TeamModel>> getTeamModels() async {
    // final response = await client.get(Uri.parse(Urls.allTeams));

    // if (response.statusCode == 200) {
    //   return (json.decode(response.body) as List)
    //   .map((data) => TeamModel.fromJson(data))
    //   .toList();
    // } else {
    //   throw ServerException();
    // }

    return [
      TeamModel(name: 'team1'),
      TeamModel(name: 'team2'),
      TeamModel(name: 'team3')
    ];
  }
}
