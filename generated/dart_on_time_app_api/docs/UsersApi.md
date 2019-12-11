# swagger.api.UsersApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1UsersAddrolePost**](UsersApi.md#apiV1UsersAddrolePost) | **Post** /api/v1/Users/addrole | 
[**apiV1UsersGet**](UsersApi.md#apiV1UsersGet) | **Get** /api/v1/Users | 


# **apiV1UsersAddrolePost**
> RoleResponse apiV1UsersAddrolePost(body)



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
    var result = api_instance.apiV1UsersAddrolePost(body);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1UsersAddrolePost: $e\n");
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

