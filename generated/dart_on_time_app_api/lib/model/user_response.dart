import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_response.jser.dart';

class UserResponse {
  
  final String email;
  
  final String userName;
   /* Set of errors that can potentially occur */
  final List<String> errors;
   /* If the request was succesfull or not */
  final bool success;
  

  UserResponse(
    

{
     this.email = null,  
     this.userName = null,  
     this.errors = const [],  
     this.success = null 
    
    }
  );

  @override
  String toString() {
    return 'UserResponse[email=$email, userName=$userName, errors=$errors, success=$success, ]';
  }
}

@GenSerializer()
class UserResponseSerializer extends Serializer<UserResponse> with _$UserResponseSerializer {

}
