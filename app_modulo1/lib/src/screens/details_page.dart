import 'dart:ui';

import 'package:app_modulo1/src/components/tab_ingredient_widget.dart';
import 'package:app_modulo1/src/components/tab_preparation_widget.dart';
import 'package:app_modulo1/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

class DetailsPage extends StatefulWidget {
  Recipe recipe;
  final ServerController serverController;

  DetailsPage({required this.recipe, required this.serverController, key})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool? favorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.recipe.name),
                  expandedHeight: 320,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(widget.recipe.photo))),
                    child: Container(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  pinned: true,
                  bottom: TabBar(
                      indicatorWeight: 4,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(
                          child: Text(
                            'Ingredientes',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Preparación',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ]),
                  actions: [
                    if (widget.recipe.user.id ==
                        widget.serverController.loggedUser!.id)
                      IconButton(
                          onPressed: () async {
                            final nRecipe = await Navigator.of(context)
                                .pushNamed("/edit_recipe",
                                    arguments: widget.recipe) as Recipe;
                            setState(() {
                              widget.recipe = nRecipe;
                            });
                          },
                          icon: Icon(Icons.edit)),
                    getFavoriteWidget(),
                    IconButton(
                        onPressed: () {
                          _showRecipeInfo(context);
                        },
                        icon: Icon(Icons.help_outline)),
                  ],
                )
              ];
            },
            body: TabBarView(children: [
              TabIngredientWidget(recipe: widget.recipe),
              TabPreparationWidget(recipe: widget.recipe)
            ])),
      ),
    );
  }

  Widget getFavoriteWidget() {
    if (favorite != null) {
      if (favorite == true) {
        return IconButton(
            color: Colors.red,
            onPressed: () async {
              await widget.serverController.deleteFavorite(widget.recipe);
              setState(() {
                favorite = false;
              });
            },
            icon: Icon(Icons.favorite));
      }
      if (favorite == false) {
        return IconButton(
            color: Colors.white,
            onPressed: () async {
              await widget.serverController.addFavorite(widget.recipe);
              setState(() {
                favorite = true;
              });
            },
            icon: Icon(Icons.favorite_border));
      }
    }
    return Container(
        margin: EdgeInsets.all(15),
        width: 30,
        child: CircularProgressIndicator());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadState();
  }

  void loadState() async {
    final state = await widget.serverController.getIsFavorite(widget.recipe);
    setState(() {
      this.favorite = state;
    });
  }

  void _showRecipeInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Acerca de la receta"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Nombre: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(widget.recipe.name),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Usuario: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Text(widget.recipe.user.nickname),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Fecha de publicación: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                      "${widget.recipe.date.day}/${widget.recipe.date.month}/${widget.recipe.date.year}"),
                ],
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cerrar"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
