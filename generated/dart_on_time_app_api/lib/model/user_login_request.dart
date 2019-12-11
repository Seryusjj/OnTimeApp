import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_login_request.jser.dart';

class UserLoginRequest {
   /* The email of the user */
  final String email;
   /* The password of the user */
  final String password;
  

  UserLoginRequest(
    

{
    
     this.email = null,  
     this.password = null 
    }
  );

  @override
  String toString() {
    return 'UserLoginRequest[email=$email, password=$password, ]';
  }
}

@GenSerializer()
class UserLoginRequestSerializer extends Serializer<UserLoginRequest> with _$UserLoginRequestSerializer {

}
