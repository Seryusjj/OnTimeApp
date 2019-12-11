# swagger.api.RolesApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1RolesGet**](RolesApi.md#apiV1RolesGet) | **Get** /api/v1/Roles | 
[**apiV1RolesRegisterPost**](RolesApi.md#apiV1RolesRegisterPost) | **Post** /api/v1/Roles/register | 


# **apiV1RolesGet**
> StringResponseSet apiV1RolesGet()



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new RolesApi();

try { 
    var result = api_instance.apiV1RolesGet();
    print(result);
} catch (e) {
    print("Exception when calling RolesApi->apiV1RolesGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**StringResponseSet**](StringResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1RolesRegisterPost**
> RoleResponse apiV1RolesRegisterPost(body)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new RolesApi();
var body = new RoleRegistrationRequest(); // RoleRegistrationRequest | 

try { 
    var result = api_instance.apiV1RolesRegisterPost(body);
    print(result);
} catch (e) {
    print("Exception when calling RolesApi->apiV1RolesRegisterPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RoleRegistrationRequest**](RoleRegistrationRequest.md)|  | [optional] 

### Return type

[**RoleResponse**](RoleResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

