class User {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  List<String>? cars;

  String? role;
  //List<List<String>>?services;

  User(
      {this.address,
      required this.email,
      required this.mobile,
      required this.name,
      this.uid,
      this.cars,
      this.role});
  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "mobile": mobile,
        "name": name,
        "uid": uid,
        'cars': cars,
        'role': role
        //'services':services
      };
}

class Partner {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  String? companyname;
  List<String>? services;
  String? role;
  Partner(
      {this.address,
      this.email,
      this.mobile,
      this.name,
      this.uid,
      this.companyname,
      this.services,
      this.role});
  Map<String, dynamic> toJson() => {
        'name': name,
        'companyname': companyname,
        'address': address,
        'email': email,
        'mobile': mobile,
        'uid': uid,
        'services': services,
        'role': role
      };
}
