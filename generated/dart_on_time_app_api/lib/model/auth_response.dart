import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'auth_response.jser.dart';

class AuthResponse {
   /* The token assigned to the user */
  final String token;
   /* Set of errors that can potentially occur */
  final List<String> errors;
   /* If the request was succesfull or not */
  final bool success;
  

  AuthResponse(
    

{
     this.token = null,  
     this.errors = const [],  
     this.success = null 
    
    }
  );

  @override
  String toString() {
    return 'AuthResponse[token=$token, errors=$errors, success=$success, ]';
  }
}

@GenSerializer()
class AuthResponseSerializer extends Serializer<AuthResponse> with _$AuthResponseSerializer {

}
