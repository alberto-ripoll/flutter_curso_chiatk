import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'avanced/asset_file.dart';
import 'recipe.dart';
import 'user.dart';

List<User> users = [];
List<Recipe> recipes = [];
List<Recipe> favorites = [];
void generateData(BuildContext context) {
  final AssetBundle assetBundle = DefaultAssetBundle.of(context);
  users = [
    User(
        id: 1,
        nickname: "Adriana20",
        password: "adriana",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img1.jpg")),
    User(
        id: 2,
        nickname: "Mauri38",
        password: "mauri",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img2.jpg")),
    User(
        id: 3,
        nickname: "Steven2019",
        password: "steven",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img3.jpg")),
    User(
        id: 4,
        nickname: "Leopoldo500",
        password: "leopoldo",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img4.jpg")),
    User(
        id: 5,
        nickname: "Julia38",
        password: "julia",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img6.jpg")),
    User(
        id: 6,
        nickname: "KatyPerez",
        password: "katy",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img7.jpg")),
    User(
        id: 7,
        nickname: "EnrryLirico",
        password: "enrry",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img8.jpg")),
    User(
        id: 8,
        nickname: "RosaFuentes",
        password: "rosa",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img9.jpg")),
    User(
        id: 9,
        nickname: "MarlonMartinez",
        password: "marlon",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img10.jpg")),
    User(
        id: 10,
        nickname: "EsperanzaJoya",
        password: "esperanza",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img11.jpg")),
    User(
        id: 10,
        nickname: "Gumercinda",
        password: "gumercinda",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img12.jpg")),
    User(
        id: 11,
        nickname: "EnriquetaValle",
        password: "enriqueta",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img13.jpg")),
    User(
        id: 12,
        nickname: "LuzAlf",
        password: "luz",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img14.jpg")),
    User(
        id: 13,
        nickname: "SorayaCastaneda",
        password: "soraya",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img15.jpg")),
    User(
        id: 14,
        nickname: "SuyinHu",
        password: "suyin",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img16.jpg")),
    User(
        id: 15,
        nickname: "EstelaMartinez",
        password: "estela",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img17.jpg")),
    User(
        id: 16,
        nickname: "LuisaMaga??",
        password: "luisa",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img18.jpg")),
    User(
        id: 17,
        nickname: "Yakinawa",
        password: "yakinawa",
        gender: Gender.FEMALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img19.jpg")),
    User(
        id: 18,
        nickname: "LuisEnrique",
        password: "luis",
        gender: Gender.MALE,
        photo: AssetFile(assetBundle, "assets/images/usuarios/img20.jpg")),
  ];

  recipes = <Recipe>[
    Recipe(
        description:
            "Es una receta muy sencilla, su nivel de dificultad es de casi cero "
            "ya que no requiere de gran experiencia para poder realizarla, "
            "los ingredientes son accesibles y f??ciles de conseguir es una "
            "comida ideal para acompa??ar con cualquier otro platillo, "
            "su sabor y textura despiertan el paladar de cualquier comensal "
            "y es que los salvadore??os sin duda alguna saben llegar al "
            "coraz??n de sus allegados a trav??s de la comida.",
        date: DateTime.now(),
        id: 1,
        ingredients: <String>[
          "4 pechugas de pollo",
          "Cilantro (una cucharada )",
          "Sal",
          "Ajo",
          "2 tazas de Pan rallado",
          "Mostaza",
          "Pimienta",
          "Aceite para fre??r",
          "2 huevos",
          "2 tazas de harina de trigo"
        ],
        name: "Pollo empanizado",
        steps: <String>[
          "Mezclar en una taza las 2 tazas de harina, 2 tazas de pan rallado, sal y pimienta al gusto a esto se le a??adir??n los 2 huevos previamente batidos hasta conseguir una mezcla homog??nea.",
          "En una taza a parte sazonar las pechugas de pollo con ajo finamente picado, sal, pimienta, mostaza y cilantro, dejar reposar por 15 minutos en la nevera para que todos los ingredientes se concentren y se adhieran a las pechugas de pollo.",
          "En un sart??n se debe colocar aceite para fre??r, pasar las pechugas de pollo por la mezcla homog??nea y cubrir perfectamente todas las pechugas para luego incorporarlas en aceite caliente hasta que se cocinen y queden completamente doradas y crujientes, sacar y dejar secar el aceite en toallas absorbentes.",
          "Estas piezas de pollos pueden acompa??arse perfectamente con una ensalada de tomates, lechuga y cebolla o simplemente con lo que usted guste y tenga a su alcance.",
        ],
        user: users[0],
        photo: AssetFile(
            assetBundle, "assets/images/platillos/pollo-empanizado.jpg")),
    Recipe(
        name: "Sopa de tortillas",
        description:
            "La sopa de tortillas es uno de los platos favoritos de los salvadore??os por ser relativamente f??cil a la hora de preparar, rinde lo suficiente y es ideal para compartir con gran parte de la familia, los ingredientes son accesibles  y es s??per deliciosa.",
        date: DateTime.now(),
        id: 2,
        ingredients: <String>[
          "6 tortillas cortadas en tiras peque??as previamente fritas.",
          "3 tomates.",
          "2 cebollas medianas.",
          "3 dientes de ajo.",
          "2 aguacates.",
          "2 pechugas de pollo previamente cocidas.",
          "Ramitos de cilantro al gusto.",
          "Crema de queso.",
          "Queso rallado al gusto.",
          "1 litro de consom?? o sal al gusto."
        ],
        steps: <String>[
          "En 1 litro de consom?? colocar el pollo cortado en trocitos, de manera opcional puede sofre??r los trozos del pollo para a??adir un poco m??s de sabor a la preparaci??n, agregar los ramitos de cilantro, la sal, el tomate, la cebolla y los dientes de ajos cortados en cuadros peque??os y sofritos previamente en aceite, dejar que hierva por 5 minutos, retirar y dejar reposar.",
          "Cortar el aguacate en trocitos colocar encima de la sopa a manera de presentaci??n todo esto junto a las tiras de tortillas, queso rallado, queso crema, decorar el platillo con ramitos de cilantro al gusto y a degustar se ha dicho.",
          "Lo que s?? es seguro y no se puede negar es que los salvadore??os tienen estilo y saz??n a la hora de preparar este delicioso plato, aprecian y reconocen el intercambio de saberes cuando de cocina se trata y le agregan su ???toque m??gico??? a la hora de realizar esta rica receta.",
        ],
        user: users[6],
        photo: AssetFile(
            assetBundle, "assets/images/platillos/sopa-de-tortillas.jpg")),
    Recipe(
        name: "Pupusas de pollo",
        description:
            "Las pupusas de pollo son un plato t??pico que deleita al paladar de los salvadore??os. Te ense??amos como hacerlas en unos simples pasos. De esta manera podr??s disfrutar estas ricas pupusas de pollo.",
        date: DateTime.now(),
        id: 3,
        ingredients: <String>[
          "Una cebolla mediana",
          "La mitad de un piment??n mediano, de preferencia rojo",
          "300 gramos de queso mozzarella",
          "?? de kilo de muslos de pollo",
          "50 gramos de tomate, licuado o triturado",
          "Aceite comestible, lo usaremos para fre??r",
          "Una o dos cucharadas de sal"
        ],
        steps: <String>[
          "Lo recomendable es fre??r las piezas de pollo durante aproximadamente 5 minutos por un lado y luego cinco adicionales por el otro. Posteriormente colocarlos en una olla donde verteremos agua hasta cubrir los muslos. Luego se debe cocinarlos.",
          "Tenemos que esperar que hierva, se tapa y se cocina a fuego lento durante una hora. En otro lugar, en un recipiente vaciamos la harina y la levadura. A??adimos la sal y revolvemos. Se agrega el agua y un poco de aceite. Luego se amasa hasta que no queden residuos en nuestras manos y se deja reposar por una hora aproximadamente.",
          "Al terminar la preparaci??n del pollo, retiramos la carne de los huesos y trituramos bien. Luego se pican los pimentones y las cebollas para luego sofre??r. Cuando est??n dorados se le a??ada el pollo.",
          "Para continuar, se hacen bolitas de masa y se forma la tortilla. El tama??o de la tortilla depender?? del gusto. Lo recomendable es dejar medio cent??metro de grosor y cocinar a fuego lento.",
          "Una vez lista la tortilla, picamos el queso mozarela y lo a??adimos a la mezcla del pollo. Todos estos ingredientes se ponen en el centro de la tortilla. Se cubre la mezcla al doblar la tortilla y se vuelve a dar forma de circulo.",
          "Finalmente, se debe colocar en la plancha o comal y esperar de 5 a 8 a minutos."
        ],
        user: users[3],
        photo: AssetFile(
            assetBundle, "assets/images/platillos/pupusas-de-pollo.jpg")),
    Recipe(
        name: "Coctel de camar??n",
        description:
            "El coctel de camar??n es una incre??ble receta salvadore??a propicia para consumir en momentos de calor por las propiedades refrescantes que genera y el sabor exquisito que presenta, si no eres al??rgico a los camarones esta ser?? una comida que definitivamente deber??s probar.",
        date: DateTime.now(),
        id: 4,
        ingredients: <String>[
          "1 tomate.",
          "1 cebolla.",
          "Cilantro al gusto.",
          "Camarones (pelados y limpios).",
          "Sal",
          "4 limones.",
          "Ajo",
          "2 aguacates.",
          "Or??gano.",
          "Salsa de soya.",
          "Pimienta",
          "Galletas de soda."
        ],
        steps: <String>[
          "Cortar el tomate, el cilantro, el aguacate y la cebolla en trocitos peque??os y guardar en un taz??n, a parte poner a hervir los camarones con ajo picadito, or??gano, pimienta y sal al gusto, una vez est??n cocidos se dejan enfriar",
          "Mezclar el tomate, el cilantro, el aguacate y la cebolla junto a los camarones ya cocidos, exprimir el jugo de 4 limones, a??adir salsa de soya, el clamato, sal, pimienta y un toque de or??gano al gusto.",
          "Verter toda esa mezcla en un recipiente (copa grande preferiblemente) y acompa??ar con galletas de soda.",
          "Cabe destacar que el coctel de camar??n adem??s de ser exquisito es un plato considerado afrodisiaco a nivel mundial, disfrutarlo ser?? una grata sensaci??n culinaria."
        ],
        user: users[7],
        photo: AssetFile(assetBundle,
            "assets/images/platillos/hacer-coctel-de-camaron.jpg")),
    Recipe(
        name: "Escabeche salvadore??o",
        description:
            "El escabeche salvadore??o es un acompa??ante t??pico en la regi??n para casi cualquier plato principal, aunque tradicionalmente tomados como el complemento especial para los s??ndwiches de pollo o pavo, su base por lo general es repollo o coliflor, y acompa??ado por zanahorias, ejotes, chiles, cebollas y especias al gusto que se fusionan en una excelente combinaci??n de sabores para degustar al paladar de las familias salvadore??as.",
        date: DateTime.now(),
        id: 5,
        ingredients: <String>[
          "1 Repollo o coliflor (de aproximadamente 200 gramos).",
          "1 Zanahoria.",
          "Ejotes",
          "Aj?? picante verde.",
          "1 Cebolla.",
          "30gr de mostaza.",
          "50gr de mayonesa.",
          "Or??gano y pimienta al gusto.",
          "100 gr de margarina.",
          "Opcionalmente consom?? de pollo o pavo."
        ],
        steps: <String>[
          "Hacer tiras finas con el repollo o coliflor, zanahoria, cebolla y aj??, derretir la margarina en ba??o mar??a y agregarle pimienta y or??gano al gusto.",
          "Luego sofre??r los vegetales ya hechos tiras en la margarina por 5 minutos, el siguiente paso es agregar la mayonesa y la mostaza, y en caso de desearlo el consom?? de pollo o pavo, dejando cocinar a fuego lento por 8 minutos aproximadamente.",
          "En definitiva, el escabeche salvadore??o es uno de los platos que no puedes dejar de probar si alg??n d??a visitas el salvador.",
        ],
        user: users[6],
        photo: AssetFile(
            assetBundle, "assets/images/platillos/escabeche-salvadoreno.jpg")),
    Recipe(
        name: "Empanadas Salvadore??as",
        description:
            "Esta versi??n del Salvador es ??nica en su regi??n; es un bollo elaborado con pl??tano maduro y relleno con frijoles refritos o ???poleada???; una mezcla dulce a base de maicena y leche con la espesura de un atol.\n"
            "En la gastronom??a Salvadore??a se prepara desde tiempos antiguos y se puede acompa??ar con chocolate caliente, caf?? o alguna bebida nacional.",
        date: DateTime.now(),
        id: 6,
        ingredients: <String>[
          "Pl??tanos maduros",
          "Maicena",
          "Leche",
          "Ramas de canela",
          "Frijoles refritos",
          "Az??car",
          "Aceite"
        ],
        steps: <String>[
          "Se le cortan las puntas a los pl??tanos, se pican por la mitad y se meten en agua caliente hasta que se cocinen. Retirarlos del agua y quitarles la piel.",
          "En una sart??n calentar a fuego bajo la leche con la canela.",
          "Diluir la maicena y el az??car en un poquito de leche fr??a y agregarlo a la cacerola cuando la leche est?? a punto de hervir",
          "Seguir cocinando a fuego bajo y moviendo con cuchara de madera para que no se peque a la cacerola. Cuando haya espesado bastante, bajar del fuego y reservar.",
          "Hacer un pur?? uniforme con los pl??tanos.",
          "Cada empanada se forma tomando una bolita del pur?? de pl??tano, la aplastamos con las manos y ponemos en el centro la poleada o frijoles fritos. Luego cerramos bien hasta que quede bien envuelto el relleno",
          "Ponemos a fre??r en aceite caliente a fuego bajo hasta que doren.",
          "Espolvorear con az??car."
        ],
        user: users[9],
        photo: AssetFile(
            assetBundle, "assets/images/platillos/empanadas-salvadorenas.jpg")),
    Recipe(
        name: "Sopa de tortillas",
        description:
            "La sopa de tortillas es uno de los platos favoritos de los salvadore??os por ser relativamente f??cil a la hora de preparar, rinde lo suficiente y es ideal para compartir con gran parte de la familia, los ingredientes son accesibles  y es s??per deliciosa.",
        date: DateTime.now(),
        id: 7,
        ingredients: <String>[
          "500 gr nalga o bola de lomo cortada para milanesas",
          "50 gr (o un poco m??s si te gusta) grasa de pella",
          "1 morr??n",
          "2-3 cebollas grandes",
          "4-5 cebollitas de verdeo",
          "2 cdas piment??n dulce",
          "sal y pimienta reci??n molida a gusto",
          "1 pizca comino (ojo no mucho es bastante invasivo)",
          "1 cdas aj?? molido",
          "1 cda o 2 de condimento para rellenos y empanadas",
          "3 huevos duros",
          "150 gr aceitunas",
          "50 gr pasas de uvas (opcional)",
          "24 tapas de empanadas hojaldre o criollas tipo rotiseras"
        ],
        steps: <String>[
          "Saltear en un fondito de grasa (o aceite si las prefer??s m??s livianas) las cebollas y el morr??n. Salar",
          "Una vez bien hecho el sofrito.",
          "Agregar la carne en cortada en cubitos peque??os. Hay quienes previamente pasan la carne por agua hirviendo pero yo prefiero que todos los jugos queden ac??. Cocinar unos minutos y condimentar con aj?? molido, pimienta, rectificar sal, bastante piment??n dulce del bueno y comino si te gusta. Tambi??n suelo utilizar la mezcla de especies de la marca Alicante especial para rellenos de empanadas.",
          "Dejar enfriar el relleno, lo ideal es de un d??a para otro para que est?? m??s sabroso. Ponemos el huevo duro picadito (no muy chiquito) si te gusta se pueden agregar pasas y aceitunas.",
          "Armar las empanadas.",
          "Hacer el repulgue, acomodar en placa y pintar con huevo batido. Llevar a cocinar en horno pre-calentado FUERTE 220?? durante 12 a 15 minutos.",
          "Ahora si...listas para llevar a la mesa !!! Bien sabrosas y jugosas nuestras empanadas."
        ],
        user: users[9],
        photo: AssetFile(
            assetBundle, "assets/images/platillos/empanadas-argentinas.jpg")),
  ];
}
