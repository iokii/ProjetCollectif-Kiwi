class Post {
  Post(this.title, this.desc, this.urlMedia, this.author, this.authorPfp,
      this.date);
  String title = "";
  String desc = "";
  bool isLiked = false;
  String urlMedia = "";
  String author = "";
  String authorPfp = "";
  DateTime date;

  factory Post.fromJson(Map<String, dynamic> json) {
    int seconds = json['date']['_seconds'];
    int nanoseconds = json['date']['_nanoseconds'];

    // Convert seconds and nanoseconds into a DateTime object
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + nanoseconds ~/ 1000000);
    return Post(
      json['title'],
      json['desc'],
      json['urlMedia'],
      json['author'],
      json['authorPfp'],
      date,
    );
  }
}
