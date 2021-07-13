import 'package:app_modulo1/src/connection/server_controller.dart';
import 'package:app_modulo1/src/screens/add_recipe_page.dart';
import 'package:app_modulo1/src/screens/details_page.dart';
import 'package:app_modulo1/src/screens/login_page.dart';
import 'package:app_modulo1/src/screens/my_favorites_page.dart';
import 'package:app_modulo1/src/screens/my_recipes_page.dart';
import 'package:app_modulo1/src/screens/register_page.dart';
import 'package:app_modulo1/src/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'connection/server_controller.dart';

ServerController _serverController = ServerController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.cyan,
          accentColor: Colors.cyan[300],
          accentIconTheme: IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.white, fontSize: 21)),
              iconTheme: IconThemeData(color: Colors.white))),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case '/':
              return LoginPage(_serverController, context);
            case '/register':
              User userlogged = (settings.arguments) as User;
              return RegisterPage(_serverController, context,
                  userToEdit: userlogged);
            case '/favorites':
              return MyFavoritePage(_serverController);
            case '/user_recipes':
              return MyRecipesPage(_serverController);
            case '/home':
              User userlogged = (settings.arguments) as User;
              _serverController.loggedUser = userlogged;
              return HomePage(_serverController);
            case "/add_recipe":
              Recipe recipe = settings.arguments as Recipe;
              return AddRecipePage(
                _serverController,
                recipe: recipe,
              );
            case "/edit_recipe":
              Recipe recipe = settings.arguments as Recipe;
              return AddRecipePage(
                _serverController,
                recipe: recipe,
              );
            case '/details':
              Recipe recipe = (settings.arguments) as Recipe;
              return DetailsPage(
                  recipe: recipe, serverController: _serverController);
            default:
              return LoginPage(_serverController, context);
          }
        });
      },
    );
  }
}
