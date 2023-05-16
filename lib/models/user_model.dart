class User {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  List<String>?cars;

  User(
      {this.address,
      required this.email,
      required this.mobile,
      required this.name,
       this.uid,this.cars});
  Map<String,dynamic> toJson()=>{
    "address":address,
    "email":email,
    "mobile":mobile,
    "name":name,
    "uid":uid,
    'cars':cars
  };
}
