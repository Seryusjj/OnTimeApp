# swagger.api.IdentityApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1IdentityInitPost**](IdentityApi.md#apiV1IdentityInitPost) | **POST** /api/v1/Identity/init | Creates default admin user, this is added because we do not have a real database where to add this info.  We use an in memory db so each time the service is restarted, this should be called
[**apiV1IdentityLoginPost**](IdentityApi.md#apiV1IdentityLoginPost) | **POST** /api/v1/Identity/login | Login user in the system
[**apiV1IdentityRegisterPost**](IdentityApi.md#apiV1IdentityRegisterPost) | **POST** /api/v1/Identity/register | Register a new user in the system


# **apiV1IdentityInitPost**
> apiV1IdentityInitPost()

Creates default admin user, this is added because we do not have a real database where to add this info.  We use an in memory db so each time the service is restarted, this should be called

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new IdentityApi();

try { 
    api_instance.apiV1IdentityInitPost();
} catch (e) {
    print("Exception when calling IdentityApi->apiV1IdentityInitPost: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1IdentityLoginPost**
> AuthResponse apiV1IdentityLoginPost(body)

Login user in the system

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new IdentityApi();
var body = new UserLoginRequest(); // UserLoginRequest | The user information

try { 
    var result = api_instance.apiV1IdentityLoginPost(body);
    print(result);
} catch (e) {
    print("Exception when calling IdentityApi->apiV1IdentityLoginPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserLoginRequest**](UserLoginRequest.md)| The user information | [optional] 

### Return type

[**AuthResponse**](AuthResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1IdentityRegisterPost**
> AuthResponse apiV1IdentityRegisterPost(body)

Register a new user in the system

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new IdentityApi();
var body = new UserRegistrationRequest(); // UserRegistrationRequest | The new user information

try { 
    var result = api_instance.apiV1IdentityRegisterPost(body);
    print(result);
} catch (e) {
    print("Exception when calling IdentityApi->apiV1IdentityRegisterPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserRegistrationRequest**](UserRegistrationRequest.md)| The new user information | [optional] 

### Return type

[**AuthResponse**](AuthResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

