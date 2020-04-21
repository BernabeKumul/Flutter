class Perfil {
  final int id;
  final String name;
  final String image;
  final String email;
  final String phone;
  final String about;

  Perfil({this.id, this.email, this.phone, this.about, this.name, this.image});

  factory Perfil.fromJson(Map<String, dynamic> json) {
    return Perfil(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        email: json['email'],
        phone: json['phone'],
        about: json['about']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'email': email,
    'phone': phone,
    'about': about,
  };

}