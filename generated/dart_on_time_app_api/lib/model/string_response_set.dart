import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'string_response_set.jser.dart';

class StringResponseSet {
  
  final List<String> response;
   /* Set of errors that can potentially occur */
  final List<String> errors;
   /* If the request was succesfull or not */
  final bool success;
  

  StringResponseSet(
    

{
     this.response = const [],  
     this.errors = const [],  
     this.success = null 
    
    }
  );

  @override
  String toString() {
    return 'StringResponseSet[response=$response, errors=$errors, success=$success, ]';
  }
}

@GenSerializer()
class StringResponseSetSerializer extends Serializer<StringResponseSet> with _$StringResponseSetSerializer {

}
