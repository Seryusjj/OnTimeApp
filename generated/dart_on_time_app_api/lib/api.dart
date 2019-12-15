library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/identity_api.dart';
part 'api/roles_api.dart';
part 'api/users_api.dart';

part 'model/auth_response.dart';
part 'model/role_registration_request.dart';
part 'model/role_response.dart';
part 'model/role_response_response_set.dart';
part 'model/string_response_set.dart';
part 'model/user_login_request.dart';
part 'model/user_registration_request.dart';
part 'model/user_response.dart';
part 'model/user_response_response_set.dart';
part 'model/user_role_addition_request.dart';


ApiClient defaultApiClient = new ApiClient();
