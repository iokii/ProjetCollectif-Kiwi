// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project/Models/Gallery.dart';
import 'package:project/Models/Profile.dart';
import 'Posts.dart';

class DataUser with ChangeNotifier {
  Profile fitz = Profile(
      "https://avatars.githubusercontent.com/u/98802482?v=4",
      "Fitz",
      true,
      "AWAWAWAWAWWAWAWAWAWAWAWAWAWA",
      [],
      [],
      [joconde, selfie],
      [
        "https://lh5.googleusercontent.com/p/AF1QipNHL9dU-AQbVDWe6_TwZ-f0E6jbyZi2Nj6Ke7u2=w325-h218-n-k-no"
      ],
      [tf1, onk],
      [
        Gallery(0, "Vidéo", [tf1]),
        Gallery(1, "Images", [onk])
      ],
      [
        Gallery(0, "Like", [joconde, selfie])
      ],
      [tf1],
      1);

  Profile romain = Profile(
      "https://avatars.githubusercontent.com/u/83698843?v=4",
      "Romain",
      true,
      "Comment ça va la team ?",
      [],
      [],
      [joconde, ouais],
      [],
      [sunset, kokoro],
      [
        Gallery(0, "photo", [sunset])
      ],
      [
        Gallery(0, "Like", [joconde, ouais])
      ],
      [],
      2);
  Profile pierre = Profile(
      "https://png.pngtree.com/png-clipart/20210407/ourlarge/pngtree-stone-rock-realistic-clipart-png-image_3203992.jpg",
      "Pierre Niné",
      true,
      "Je suis un racaillou avec mental caillou",
      [],
      [],
      [sunset, ouais, joconde],
      [],
      [selfie],
      [
        Gallery(0, "Photo", [selfie])
      ],
      [
        Gallery(0, "Like", [sunset, ouais, joconde])
      ],
      [],
      3);
  Profile davinci = Profile(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQTpymriyzhjQEivOvItdFuSWXQJkJZ0jXgenzThOXA&s",
      "Léonard da Vinci",
      true,
      "Piètre disciple, qui ne surpasse pas son maître !",
      [],
      [],
      [sunset, selfie, joconde],
      [
        "https://www.landrucimetieres.fr/spip/IMG/jpg/vinci.jpg",
        "https://www.slate.fr/sites/default/files/styles/768x379/public/bloch-sermononthemount_une.jpg"
      ],
      [joconde, ouais],
      [
        Gallery(0, "Peinture", [joconde, ouais])
      ],
      [
        Gallery(0, "like", [sunset, selfie, joconde])
      ],
      [],
      1);

  List<Profile> users() {
    return [fitz, romain, pierre, davinci];
  }

  void majFollow() {
    fitz.addFollows([romain]);
    fitz.addFollowers([davinci, pierre, romain]);

    romain.addFollows([fitz]);
    romain.addFollowers([fitz, davinci]);

    pierre.addFollows([davinci]);
    pierre.addFollowers([fitz, davinci]);

    davinci.addFollows([romain, pierre]);
    davinci.addFollowers([fitz]);
  }
}
