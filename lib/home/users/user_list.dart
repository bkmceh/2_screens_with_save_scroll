class UserList {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;

  UserList(this.id, this.name, this.username, this.email, this.address);

  UserList.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'] ?? 'NAME',
        name = json['name'] ?? 'FILE',
        username = json['username'] ?? 'username',
        email = json['email'] ?? 'email',
        address = json['address'];
}


