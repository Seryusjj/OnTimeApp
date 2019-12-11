import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'role_registration_request.jser.dart';

class RoleRegistrationRequest {
   /* The name of the new role */
  final String roleName;
  

  RoleRegistrationRequest(
    

{
    
     this.roleName = null 
    }
  );

  @override
  String toString() {
    return 'RoleRegistrationRequest[roleName=$roleName, ]';
  }
}

@GenSerializer()
class RoleRegistrationRequestSerializer extends Serializer<RoleRegistrationRequest> with _$RoleRegistrationRequestSerializer {

}
