import 'package:flutter/material.dart';
import 'package:project/footer.dart';
import 'package:project/header.dart';
import 'package:project/post.dart';
import 'package:project/post_list.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const loginText = "Log into $applicationName !";

class _HomePageState extends State<HomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var listPosts = [
    Post(
        "Giga photo avec la team ou quoi la ah oui",
        "Une image de coucher de soleil sur l'océan: Les nuances dorées et oranges du soleil couchant se reflètent sur les vagues calmes de l'océan. Le ciel est rempli de nuages ​​roses et pourpres, créant un spectacle magnifique et paisible.",
        "https://www.photo-paysage.com/albums/userpics/10001/thumb_Crepuscule_sur_le_lac_Leman.jpg",
        "Romain ou quoi",
        "https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png",
        ""),
    Post(
        "La Joconde",
        "Petit dessin pepouze",
        "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ-FvbbAq5IaJUhtwxXEwY0D-jiZju02ejnNHx_bQWL_27GF3srhwJgqusMAqKh3QqU",
        "De Vinci",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQTpymriyzhjQEivOvItdFuSWXQJkJZ0jXgenzThOXA&s",
        ""),
    Post(
        "Coeur coeur oui",
        "Une image d'un chaton jouant avec une pelote de laine: Le petit chaton pelucheux est assis au milieu d'une pelote de laine colorée, jouant avec les fils qui s'emmêlent autour de ses pattes. Ses grands yeux verts sont remplis de curiosité et d'émerveillement, alors qu'il explore son environnement ludique.",
        "https://archzine.fr/wp-content/uploads/2016/02/superbe-photos-nature-images-paysages-joli-paysage-violet.jpg",
        "La team",
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
        ""),
    Post(
        "Petit selfie",
        "Une image d'un marché local: Des étales colorées sont alignées dans les allées étroites du marché, offrant une variété de produits frais, des fruits et légumes aux viandes et poissons. Les commerçants locaux sourient et appellent les clients potentiels, créant une atmosphère animée et animée. Les odeurs de nourriture fraîchement préparée flottent dans l'air, attirant les visiteurs affamés.",
        "https://assets.puzzlefactory.pl/puzzle/247/829/original.jpg",
        "C'st moi",
        "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
        ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      backgroundColor: darkGray,
      body: SizedBox(
        child: ListView.builder(
          itemCount: listPosts.length,
          itemBuilder: (context, index) {
            return Card(child: PostList(listPosts[index]));
          },
        ),
      ),
      bottomNavigationBar: footer(context),
    );
  }
}
