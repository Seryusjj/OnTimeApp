import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_registration_request.jser.dart';

class UserRegistrationRequest {
   /* The email of the user */
  final String email;
   /* The password of the user */
  final String password;
  

  UserRegistrationRequest(
    

{
    
     this.email = null,  
     this.password = null 
    }
  );

  @override
  String toString() {
    return 'UserRegistrationRequest[email=$email, password=$password, ]';
  }
}

@GenSerializer()
class UserRegistrationRequestSerializer extends Serializer<UserRegistrationRequest> with _$UserRegistrationRequestSerializer {

}
