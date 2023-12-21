import 'package:getx_clean_boiler_plate/feature/team/domain/entities/team.dart';

class TeamModel extends TeamEntity {
  const TeamModel({
    required String name,
  }) : super(
          name: name,
        );

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      TeamModel(name: json['name']);

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  TeamEntity toEntity() => TeamEntity(name: name);
}
