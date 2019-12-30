# swagger.api.UsersApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1UsersAddRolePost**](UsersApi.md#apiV1UsersAddRolePost) | **POST** /api/v1/Users/AddRole | 
[**apiV1UsersAddSubordiantePost**](UsersApi.md#apiV1UsersAddSubordiantePost) | **POST** /api/v1/Users/AddSubordiante | 
[**apiV1UsersEmailGet**](UsersApi.md#apiV1UsersEmailGet) | **GET** /api/v1/Users/{email} | 
[**apiV1UsersGet**](UsersApi.md#apiV1UsersGet) | **GET** /api/v1/Users | 
[**apiV1UsersGetRolesEmailGet**](UsersApi.md#apiV1UsersGetRolesEmailGet) | **GET** /api/v1/Users/GetRoles/{email} | 
[**apiV1UsersRemoveRolePost**](UsersApi.md#apiV1UsersRemoveRolePost) | **POST** /api/v1/Users/RemoveRole | 
[**apiV1UsersSubordinatesEmailGet**](UsersApi.md#apiV1UsersSubordinatesEmailGet) | **GET** /api/v1/Users/Subordinates/{email} | 


# **apiV1UsersAddRolePost**
> RoleResponse apiV1UsersAddRolePost(body)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();
var body = new UserRoleAdditionRequest(); // UserRoleAdditionRequest | 

try { 
    var result = api_instance.apiV1UsersAddRolePost(body);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersAddRolePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserRoleAdditionRequest**](UserRoleAdditionRequest.md)|  | [optional] 

### Return type

[**RoleResponse**](RoleResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UsersAddSubordiantePost**
> UserResponse apiV1UsersAddSubordiantePost(body)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();
var body = new UserAddSubordinateRequest(); // UserAddSubordinateRequest | 

try { 
    var result = api_instance.apiV1UsersAddSubordiantePost(body);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersAddSubordiantePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserAddSubordinateRequest**](UserAddSubordinateRequest.md)|  | [optional] 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UsersEmailGet**
> UserResponse apiV1UsersEmailGet(email)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();
var email = email_example; // String | 

try { 
    var result = api_instance.apiV1UsersEmailGet(email);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersEmailGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UsersGet**
> UserResponseResponseSet apiV1UsersGet()



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();

try { 
    var result = api_instance.apiV1UsersGet();
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserResponseResponseSet**](UserResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UsersGetRolesEmailGet**
> RoleResponseResponseSet apiV1UsersGetRolesEmailGet(email)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();
var email = email_example; // String | 

try { 
    var result = api_instance.apiV1UsersGetRolesEmailGet(email);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersGetRolesEmailGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**RoleResponseResponseSet**](RoleResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UsersRemoveRolePost**
> RoleResponse apiV1UsersRemoveRolePost(body)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();
var body = new UserRoleRemoveRequest(); // UserRoleRemoveRequest | 

try { 
    var result = api_instance.apiV1UsersRemoveRolePost(body);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersRemoveRolePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserRoleRemoveRequest**](UserRoleRemoveRequest.md)|  | [optional] 

### Return type

[**RoleResponse**](RoleResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1UsersSubordinatesEmailGet**
> UserResponseResponseSet apiV1UsersSubordinatesEmailGet(email)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UsersApi();
var email = email_example; // String | 

try { 
    var result = api_instance.apiV1UsersSubordinatesEmailGet(email);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersSubordinatesEmailGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**UserResponseResponseSet**](UserResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

