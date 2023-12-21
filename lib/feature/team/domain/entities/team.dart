import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final String name;
  const TeamEntity({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
