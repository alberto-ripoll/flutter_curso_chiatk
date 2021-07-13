import 'dart:io';

import 'package:app_modulo1/src/components/image_picker_widget.dart';
import 'package:app_modulo1/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/user.dart';

class RegisterPage extends StatefulWidget {
  ServerController serverController;
  BuildContext context;
  User userToEdit;

  RegisterPage(this.serverController, this.context, {Key? key, required this.userToEdit})
      : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;
  String nickname = "";
  String password = '';
  Gender gender = Gender.MALE;
  bool showPassword = false;
  bool editing = false;

  String errMsg = '';
  File? imageFile;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          ImagePickerWidget(
              imageFile: this.imageFile,
              onImageSelected: (File file) {
                setState(() {
                  this.imageFile = file;
                });
              }),
          SizedBox(
              height: kToolbarHeight + 25,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              )),
          Center(
            child: Transform.translate(
              offset: Offset(0, -40),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 260, bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 20,
                  ),
                  child: ListView(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: this.nickname,
                        decoration: InputDecoration(labelText: "Usuario:"),
                        onSaved: (value) {
                          nickname = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        initialValue: this.password,
                        decoration: InputDecoration(
                            labelText: "Contraseña:",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: !showPassword,
                        onSaved: (value) {
                          password = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text("Genero",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]))),
                          Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioListTile(
                                    title: Text(
                                      "Masculino",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: Gender.MALE,
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value as Gender;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value as Gender;
                                        });
                                      },
                                      title: Text(
                                        "Femenino",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      value: Gender.FEMALE,
                                      groupValue: gender),
                                ],
                              )),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () =>_save(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!_loading) Text((editing)?"Actualizar":"Registrarse"),
                              if (_loading)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(left: 20),
                                  child: CircularProgressIndicator(),
                                )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15))),
                      if (errMsg.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            errMsg,
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _save(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (imageFile == null) {
        showSnackbar(context, "Seleccione una imagen", Colors.orange);
        return;
      }
      User user = User(gender: this.gender, nickname: this.nickname, password: this.password, photo: this.imageFile);
      var state;
      if (editing){
        user.id = widget.serverController.loggedUser!.id;
        state = await widget.serverController.updateUser(user);
      }else{
        state = await widget.serverController.addUser(user);
      }
      if (state == false){
        showSnackbar(context, "No se pudo ${editing?"actualizar":"guardar"}", Colors.orange);
      }else{
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Información"),
              content: Text("Usuario ${editing?"actualizado":"guardado"} exitosamente"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context,user);
                }, 
                child: Text("Ok"))
              ],
            );
          }
          ); 
      }
    }
  }

  void showSnackbar(BuildContext context, String title, Color backColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
      ),
      backgroundColor: backColor,
    ));
  }

  @override
  void initState(){
    super.initState();
    editing = (widget.userToEdit != null);
    if (editing){
      this.nickname = widget.userToEdit.nickname;
      this.password = widget.userToEdit.password;
      this.imageFile = widget.userToEdit.photo;
      this.gender = widget.userToEdit.gender;

    }
  }

}
