import 'package:flutter/cupertino.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';
import 'package:flutter_modulo1_fake_backend/modulo1_fake_backend.dart'
    as server;
import 'package:flutter_modulo1_fake_backend/models.dart' as server;

class ServerController {
  User? loggedUser;
  void init(BuildContext context) {
    server.generateData(context);
  }

  Future<server.User> login(String nickname, String password) async {
    return await server.backendLogin(nickname, password);
  }

  Future<bool> addUser(User nUser) async {
    return await server.addUser(nUser);
  }

  Future<List<Recipe>> getRecipesList() async {
    return await server.getRecipes();
  }

  Future<List<Recipe>> getUserRecipesList() async {
    return await server.getUserRecipes(loggedUser);
  }
  
  Future<List<Recipe>> getFavoritesList() async {
    return await server.getFavorites();
  }

  Future<bool> updateUser(User user) async {
    loggedUser = user;
    return await server.updateUser(user);
  }

  Future<bool> getIsFavorite(Recipe recipeTocheck) async {
    return await server.isFavorite(recipeTocheck);
  }

  Future<bool> deleteFavorite(Recipe favoriteRecipe) async {
    return await server.deleteFavorite(favoriteRecipe);
  }

  Future<Recipe> addFavorite(Recipe nFavorite) async {
    return await server.addFavorite(nFavorite);
  }
    Future<bool> updateRecipe(Recipe receta) async {
    return await server.updateRecipe(receta);
  }
      Future<Recipe> addRecipe(Recipe receta) async {
    return await server.addRecipe(receta);
  }
}
