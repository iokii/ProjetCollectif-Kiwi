import 'package:project/Models/TextDiscuss.dart';

class Discussion {
  String username = "";
  String pdp = "";
  List<TextDiscuss> messages = [];

  Discussion(this.username, this.pdp, this.messages);
}
