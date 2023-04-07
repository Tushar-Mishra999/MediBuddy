import 'package:flutter/material.dart';
import 'package:medibuddy/views/chat/chat_screen.dart';
import 'package:medibuddy/views/details/store_details.dart';
import 'package:medibuddy/views/home/client.dart';
import 'package:medibuddy/views/login/login_screen.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:medibuddy/views/registration/client-registration.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';
import 'package:medibuddy/views/result/resultscreen.dart';
import 'package:medibuddy/views/seller/add_medicine.dart';
import 'package:medibuddy/views/seller/inventory_screen.dart';
import 'package:medibuddy/views/seller/update_medicine.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginScreen(),
      );
    case ClientRegistration.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ClientRegistration(),
      );
    case SellerRegistration.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SellerRegistration(),
      );
    case ClientHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ClientHomeScreen(),
      );
    case InventoryScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InventoryScreen(),
      );
    case AddMedicine.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddMedicine(),
      );

    case UpdateMedicine.routeName:
      Map<String, dynamic> arguments =
          routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UpdateMedicine(
            name: arguments['name'],
            quantity: arguments['quantity'],
            description: arguments['description'],
            company: arguments['company'],
            price: arguments['price'],
            salt: arguments['salt'],
            id: arguments['id']),
      );
    case ResultsScreen.routeName:
      Map<String, dynamic> arguments =
          routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ResultsScreen(
          searchQuery: arguments['searchQuery'],
          isCategory: arguments['isCategory'],
        ),
      );
    case StoreDetails.routeName:
      Map<String, dynamic> arguments =
          routeSettings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => StoreDetails(
          seller: arguments['seller'],
          searchQuery: arguments['searchQuery'],
          isCategory: arguments['isCategory'],
        ),
      );
    case ChatScreen.routeName:
      Map<String, dynamic> arguments =
          routeSettings.arguments as Map<String, dynamic>;
          return  MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatScreen(
          //seller:arguments['seller'],
          chatRoomId: arguments['chatRoomId'],
        ),
      );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
