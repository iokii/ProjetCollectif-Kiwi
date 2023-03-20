import 'package:flutter/material.dart';
import 'package:project/footer.dart';
import 'package:project/header.dart';
import 'package:project/post.dart';
import 'package:project/singlePublication.dart';
import 'package:project/Publication.dart';
import 'global.dart';

class DetailsPublication extends StatefulWidget {
  final Post post;
  const DetailsPublication(this.post);

  @override
  _DetailsPublicationState createState() => _DetailsPublicationState(post);
}

const loginText = "Log into $applicationName !";

class _DetailsPublicationState extends State<DetailsPublication> {
  _DetailsPublicationState(post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      backgroundColor: darkGray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 40)),
          SinglePublication(
              context,
              Publication(
                  "https://media.licdn.com/dms/image/C5603AQFij6hyL8Mt9w/profile-displayphoto-shrink_800_800/0/1628677625075?e=2147483647&v=beta&t=cetheLsMze-lmeSpC_9_gj2cq1GO1S7YiG3CcjTw-us",
                  "Maya Rodriguez",
                  "https://www.photo-paysage.com/albums/userpics/10001/thumb_Crepuscule_sur_le_lac_Leman.jpg",
                  "Coucher de soleil sur la mer",
                  "La scène qui se présente devant vous est tout simplement magnifique. Le ciel est teinté de rose, rouge et orange alors que le soleil se couche lentement à l'horizon. Les rayons du soleil se reflètent sur la mer, créant une traînée scintillante d'or et d'argent. Vous pouvez sentir la brise fraîche sur votre visage alors que vous regardez les vagues se briser doucement sur la plage de sable fin. Au loin, vous pouvez voir des montagnes majestueuses qui se dressent contre le ciel pastel. C'est une scène paisible et tranquille qui vous remplit de joie et de sérénité.")),
        ],
      ),
      bottomNavigationBar: footer(context),
    );
  }
}
