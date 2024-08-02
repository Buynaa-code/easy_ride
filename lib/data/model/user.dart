class User {
  int? id;
  String? lastName;
  String? firstName;
  String? email;
  String? phone;
  List<User>? members;

  User({this.id, this.lastName, this.firstName, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    email = json['email'];
    phone = json['phone'];

    if (json['members'] != null) {
      members =
          List<User>.from(json['members'].map((infos) => User.fromJson(infos)));
    }
  }

  isNotEmpty() {
    return id != null;
  }
}
