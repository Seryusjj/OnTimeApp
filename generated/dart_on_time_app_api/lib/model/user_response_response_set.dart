import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'package:swagger/model/user_response.dart';
part 'user_response_response_set.jser.dart';

class UserResponseResponseSet {
  
  final List<UserResponse> response;
   /* Set of errors that can potentially occur */
  final List<String> errors;
   /* If the request was succesfull or not */
  final bool success;
  

  UserResponseResponseSet(
    

{
     this.response = const [],  
     this.errors = const [],  
     this.success = null 
    
    }
  );

  @override
  String toString() {
    return 'UserResponseResponseSet[response=$response, errors=$errors, success=$success, ]';
  }
}

@GenSerializer()
class UserResponseResponseSetSerializer extends Serializer<UserResponseResponseSet> with _$UserResponseResponseSetSerializer {

}
