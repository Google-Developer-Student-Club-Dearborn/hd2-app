import 'package:hd2_app/pages/agenda_page/getDataSource.dart';

class RouteArguments {
  int selectedIndex;
  final List<Meeting> appointments;

  RouteArguments({required this.selectedIndex, required this.appointments});
}
