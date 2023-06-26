class Post {
  Post(this.title, this.desc, this.liked, this.urlMedia, this.author,
      this.authorPfp, this.date,
      {this.postId = ""});
  String postId = "";
  String title = "";
  String desc = "";
  bool liked = false;
  String urlMedia = "";
  String author = "";
  String authorPfp = "";
  DateTime date;
  String type = "";

  factory Post.fromJson(Map<String, dynamic> json) {
    int seconds = json['date']['_seconds'];
    int nanoseconds = json['date']['_nanoseconds'];
    print(json);
    // Convert seconds and nanoseconds into a DateTime object
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + nanoseconds ~/ 1000000);
    return Post(
      json['title'],
      json['desc'],
      json['liked'],
      json['urlMedia'],
      json['author'],
      json['authorPfp'],
      date,
      postId: json['postId'],
    );
  }
}
