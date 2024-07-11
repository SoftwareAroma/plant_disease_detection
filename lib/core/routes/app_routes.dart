import 'package:flutter/material.dart';
import 'package:plant_disease_detection/index.dart';

class LocalNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.coreNoInternet:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => NoInternetConnection(
            fromSplash: args != null ? args['fromSplash'] : false,
          ),
        );

      /// login page
      case RoutePaths.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: LoginPage()),
        );

      /// register page
      case RoutePaths.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: RegisterPage()),
        );

      ///Home
      case RoutePaths.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: HomePage()),
        );

      ///boarding
      case RoutePaths.boardingRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      /// Profile
      case RoutePaths.profileRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: ProfilePage()),
        );

      ///about
      case RoutePaths.aboutRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: AboutPage()),
        );

      ///help
      case RoutePaths.helpRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: HelpPage()),
        );

      ///measures
      case RoutePaths.measuresRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(
            child: MeasuresPage(),
          ),
        );

      /// default page
      default:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: HomePage()),
        );
    }
  }
}
