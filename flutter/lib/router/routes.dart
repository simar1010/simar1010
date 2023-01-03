import 'package:flutter/material.dart';
import 'package:tripplnr/router/routes_name.dart';
import 'package:tripplnr/screens/home/home_screen.dart';
import 'package:tripplnr/screens/search_screen.dart';
import 'package:tripplnr/screens/popular_hotels_screen.dart';
import 'package:tripplnr/screens/register_screen.dart';
import '../screens/login_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());
      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchScreen());
      case RoutesName.popularHotelsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PopularHotelsScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext constext) => const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Text('No Route found'),
                  ),
                ));
    }
  }
}
