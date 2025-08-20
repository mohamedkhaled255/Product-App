import 'package:lab8/contacts/helper/constants.dart';

class UserContactModel {
  int? id;
  String? name,email,phone;
  UserContactModel({ this.id,this.name,this.email,this.phone});

  toJson(){
    return {columnName : name ,columnEmail : email , columnPhone :phone};
  }

  UserContactModel.fromJson(Map<String,dynamic>json){
    id = json[columnId];
    name = json[columnName];
    email = json[columnEmail];
    phone =json[columnPhone];
  }
  
}