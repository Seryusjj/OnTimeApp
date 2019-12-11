import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'role_response.jser.dart';

class RoleResponse {
  
  final String roleName;
   /* Set of errors that can potentially occur */
  final List<String> errors;
   /* If the request was succesfull or not */
  final bool success;
  

  RoleResponse(
    

{
     this.roleName = null,  
     this.errors = const [],  
     this.success = null 
    
    }
  );

  @override
  String toString() {
    return 'RoleResponse[roleName=$roleName, errors=$errors, success=$success, ]';
  }
}

@GenSerializer()
class RoleResponseSerializer extends Serializer<RoleResponse> with _$RoleResponseSerializer {

}
