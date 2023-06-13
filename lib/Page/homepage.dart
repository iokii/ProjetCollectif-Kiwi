import 'package:flutter/material.dart';
import 'package:project/Models/Post.dart';

import '../Components/DetailsPublication.dart';
import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Components/PostList.dart';
import '../Models/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        "Coucher de soleil sur la mer",
        "Une image de coucher de soleil sur l'océan pourrait être décrite comme étant un véritable chef-d'œuvre de la nature. Les nuances dorées et oranges du soleil couchant créent une atmosphère apaisante et chaleureuse, alors qu'elles se reflètent sur les vagues calmes de l'océan. Le ciel, quant à lui, est rempli de nuages roses et pourpres, créant un spectacle magnifique et paisible. La scène est tellement hypnotique que l'on ne peut s'empêcher de ressentir une sensation de calme intérieur, tandis que l'on admire la beauté de la nature. En observant attentivement cette image, on peut presque sentir la brise marine sur notre visage, tout en se laissant bercer par le son des vagues qui viennent s'échouer doucement sur le rivage. Vraiment, c'est une vue qui mérite d'être contemplée, admirée et savourée pleinement, pour son pouvoir de nous rappeler la sérénité qui se trouve dans le monde qui nous entoure.",
        "https://www.photo-paysage.com/albums/userpics/10001/thumb_Crepuscule_sur_le_lac_Leman.jpg",
        "Maya Rodriguez",
        "https://media.licdn.com/dms/image/C5603AQFij6hyL8Mt9w/profile-displayphoto-shrink_800_800/0/1628677625075?e=2147483647&v=beta&t=cetheLsMze-lmeSpC_9_gj2cq1GO1S7YiG3CcjTw-us",
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

  late Post _selectedPost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context: context),
      backgroundColor: darkGray,
      body: SizedBox(
        child: ListView.builder(
          itemCount: listPosts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPost = listPosts[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPublication(_selectedPost),
                    ),
                  );
                });
              },
              child: Card(child: PostList(listPosts[index])),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
