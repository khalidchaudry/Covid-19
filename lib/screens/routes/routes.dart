import 'package:covid_19/screens/countries_list_screen/countries_list_screen.dart';
import 'package:covid_19/screens/splash_screen/splash_screen.dart';
import 'package:covid_19/screens/world_states_screen/world_states_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String worldDataScreen = '/worldStates';
  static const String cuntriesList = '/countryList';
  static const String detailsScreen = '/detailsScreen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case worldDataScreen:
        return MaterialPageRoute(
          builder: (_) => const WorldStateScreen(),
        );
      case cuntriesList:
        return MaterialPageRoute(
            builder: ((context) => const CountriesListScreen()));
      // case detailsScreen:
      //   return MaterialPageRoute(builder: (_) => const DetailsScreen());

      default:
        throw const FormatException("Route not found");
    }
  }
}
