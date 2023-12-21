import 'package:getx_clean_boiler_plate/feature/team/presentation/views/team_list_page.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: "/", builder: (context, state) => const TeamListPage(), routes: [
    
  ]),
]);