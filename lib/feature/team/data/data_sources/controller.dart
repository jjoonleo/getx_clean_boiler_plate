import 'package:get/get.dart';
import 'package:getx_clean_boiler_plate/feature/team/data/data_sources/remote_data_source.dart';
import 'package:http/http.dart';

class TeamRemoteDataSourceController extends GetxController {
  final Client client;
  TeamRemoteDataSourceImpl teamRemoteDataSource;

  TeamRemoteDataSourceController({required this.client}):
    teamRemoteDataSource = TeamRemoteDataSourceImpl(client: client);
}
