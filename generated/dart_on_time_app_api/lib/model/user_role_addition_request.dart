import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_role_addition_request.jser.dart';

class UserRoleAdditionRequest {
  
  final String role;
  
  final String userEmail;
  

  UserRoleAdditionRequest(
    

{
    
     this.role = null,  
     this.userEmail = null 
    }
  );

  @override
  String toString() {
    return 'UserRoleAdditionRequest[role=$role, userEmail=$userEmail, ]';
  }
}

@GenSerializer()
class UserRoleAdditionRequestSerializer extends Serializer<UserRoleAdditionRequest> with _$UserRoleAdditionRequestSerializer {

}
