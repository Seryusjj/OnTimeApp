import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_model.jser.dart';

class UserModel {
  
  final String email;
  
  final String password;
  

  UserModel(
    

{
    
     this.email = null,  
     this.password = null 
    }
  );

  @override
  String toString() {
    return 'UserModel[email=$email, password=$password, ]';
  }
}

@GenSerializer()
class UserModelSerializer extends Serializer<UserModel> with _$UserModelSerializer {

}
