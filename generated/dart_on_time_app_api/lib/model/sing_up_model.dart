import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'sing_up_model.jser.dart';

class SingUpModel {
  
  final String email;
  
  final String password;
  
  final String repeatPassword;
  

  SingUpModel(
    

{
    
     this.email = null,  
     this.password = null,  
     this.repeatPassword = null 
    }
  );

  @override
  String toString() {
    return 'SingUpModel[email=$email, password=$password, repeatPassword=$repeatPassword, ]';
  }
}

@GenSerializer()
class SingUpModelSerializer extends Serializer<SingUpModel> with _$SingUpModelSerializer {

}
