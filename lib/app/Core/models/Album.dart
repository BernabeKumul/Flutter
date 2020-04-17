class Album {
  final int id;
  final String title;
  final String subtitle;
  final String img;

  Album({this.id, this.title, this.subtitle, this.img});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        title: json['title'],
        subtitle: json['subtitle'],
        img: json['img']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'img': img,
  };
}
