import 'package:hd2_app/shared/HDEvent.dart';

class RouteArguments {
  int selectedIndex;
  final List<HDEvent> hdevents;

  RouteArguments({required this.selectedIndex, required this.hdevents});
}
