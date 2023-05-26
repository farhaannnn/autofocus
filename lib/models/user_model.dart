class User {
  String? address;
  String? email;
  String? mobile;
  String? name;
  String? uid;
  List<String>?cars;
  List<String>?servicetype;
  List<String>?date;
  List<String>?time;
  String? role;
  //List<List<String>>?services;

  User(
      {this.address,
      required this.email,
      required this.mobile,
      required this.name,
       this.uid,this.cars,this.servicetype,this.date,this.time,this.role});
  Map<String,dynamic> toJson()=>{
    "address":address,
    "email":email,
    "mobile":mobile,
    "name":name,
    "uid":uid,
    'cars':cars,
    'servicetype':servicetype,
    'date':date,
    'time':time,
    'role':role
    //'services':services
  };
}
