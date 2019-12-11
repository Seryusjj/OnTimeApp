library swagger.api;

import 'package:http/http.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:swagger/auth/api_key_auth.dart';
import 'package:swagger/auth/basic_auth.dart';
import 'package:swagger/auth/oauth.dart';

import 'package:swagger/api/identity_api.dart';
import 'package:swagger/api/roles_api.dart';
import 'package:swagger/api/users_api.dart';

import 'package:swagger/model/auth_response.dart';
import 'package:swagger/model/role_registration_request.dart';
import 'package:swagger/model/role_response.dart';
import 'package:swagger/model/string_response_set.dart';
import 'package:swagger/model/user_login_request.dart';
import 'package:swagger/model/user_registration_request.dart';
import 'package:swagger/model/user_response.dart';
import 'package:swagger/model/user_response_response_set.dart';
import 'package:swagger/model/user_role_addition_request.dart';


final jsonJaguarRepo = JsonRepo()
..add(AuthResponseSerializer())
..add(RoleRegistrationRequestSerializer())
..add(RoleResponseSerializer())
..add(StringResponseSetSerializer())
..add(UserLoginRequestSerializer())
..add(UserRegistrationRequestSerializer())
..add(UserResponseSerializer())
..add(UserResponseResponseSetSerializer())
..add(UserRoleAdditionRequestSerializer())
;

final _defaultInterceptors = [OAuthInterceptor(), BasicAuthInterceptor(), ApiKeyAuthInterceptor()];

class JaguarApiGen {
    List<Interceptor> interceptors;
    String basePath = "https://localhost";
    Route _baseRoute;

    /**
     * Add custom global interceptors, put overrideInterceptors to true to set your interceptors only (auth interceptors will not be added)
     */
    JaguarApiGen({List<Interceptor> interceptors, bool overrideInterceptors = false, String baseUrl}) {
        _baseRoute = Route(baseUrl ?? basePath).withClient(globalClient ?? IOClient());
        if(interceptors == null) {
            this.interceptors = _defaultInterceptors;
        }
        else if(overrideInterceptors){
            this.interceptors = interceptors;
        }
        else {
            this.interceptors = List.from(_defaultInterceptors)..addAll(interceptors);
        }

        this.interceptors.forEach((interceptor) {
            _baseRoute.before(interceptor.before);
            _baseRoute.after(interceptor.after);
        });
    }

    void setOAuthToken(String name, String token) {
        (_defaultInterceptors[0] as OAuthInterceptor).tokens[name] = token;
    }

    void setBasicAuth(String name, String username, String password) {
        (_defaultInterceptors[1] as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }

    void setApiKey(String name, String apiKey) {
        (_defaultInterceptors[2] as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }

    
    /**
     * Get IdentityApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    IdentityApi getIdentityApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return IdentityApi(base: base, serializers: serializers);
    }

    
    /**
     * Get RolesApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    RolesApi getRolesApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return RolesApi(base: base, serializers: serializers);
    }

    
    /**
     * Get UsersApi instance, base route and serializer can be overridden by a given but be careful,
     * by doing that all interceptors will not be executed
     */
    UsersApi getUsersApi({Route base, SerializerRepo serializers}) {
        if(base == null) {
            base = _baseRoute;
        }
        if(serializers == null) {
            serializers = jsonJaguarRepo;
        }
        return UsersApi(base: base, serializers: serializers);
    }

    
}