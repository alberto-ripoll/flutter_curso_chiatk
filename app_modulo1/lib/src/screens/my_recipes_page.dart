import 'package:app_modulo1/src/components/my_drawer.dart';
import 'package:app_modulo1/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

class MyRecipesPage extends StatefulWidget {
  final ServerController _serverController;
  const MyRecipesPage(this._serverController, {Key? key}) : super(key: key);

  @override
  _MyRecipesPageState createState() => _MyRecipesPageState();
}

class _MyRecipesPageState extends State<MyRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mis recetas")),
      body: FutureBuilder<List<Recipe>>(
        future: widget._serverController.getUserRecipesList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Recipe>? list = snapshot.data;
            if (list!.length == 0){
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info,size: 120,color: Colors.grey[300],),
                      Text("Nada que mostrar aquí",textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              );
            }
            return ListView.builder(
                itemCount: list!.length,
                itemBuilder: (context, index) {
                  Recipe recipe = list[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(recipe.photo),
                                  fit: BoxFit.cover)),
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.black.withOpacity(0.35),
                            child: ListTile(
                                title: Text(
                                  recipe.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                subtitle: Text(
                                  recipe.user.nickname,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite),
                                    iconSize: 32)),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}
