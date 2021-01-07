class UserParse {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  UserParse(this.id, this.name, this.username, this.email, this.address,
      this.phone, this.website, this.company);

  UserParse.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'] ?? 'NAME',
        name = json['name'] ?? 'FILE',
        username = json['username'] ?? 'username',
        email = json['email'] ?? 'email',
        address = json['address'],
        phone = json['phone'],
        website = json['website'],
        company = json['company'];
}

class UserParseList {
  List<UserParse> userParseList;

  UserParseList(this.userParseList);

  UserParseList.fromMappedJson(List<dynamic> json) {
    userParseList = json.map((user) => UserParse.fromMappedJson(user)).toList();
  }
}

class UserStore {
  static List<UserParse> userData = List();
}
