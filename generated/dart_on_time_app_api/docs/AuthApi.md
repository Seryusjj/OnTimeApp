# swagger.api.AuthApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAuthRegisteruserPost**](AuthApi.md#apiAuthRegisteruserPost) | **Post** /api/Auth/registeruser | 
[**apiAuthSigninPost**](AuthApi.md#apiAuthSigninPost) | **Post** /api/Auth/signin | 
[**apiAuthSingoutPost**](AuthApi.md#apiAuthSingoutPost) | **Post** /api/Auth/singout | 


# **apiAuthRegisteruserPost**
> bool apiAuthRegisteruserPost(body)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new AuthApi();
var body = new SingUpModel(); // SingUpModel | 

try { 
    var result = api_instance.apiAuthRegisteruserPost(body);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiAuthRegisteruserPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SingUpModel**](SingUpModel.md)|  | [optional] 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthSigninPost**
> bool apiAuthSigninPost(body)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new AuthApi();
var body = new UserModel(); // UserModel | 

try { 
    var result = api_instance.apiAuthSigninPost(body);
    print(result);
} catch (e) {
    print("Exception when calling AuthApi->apiAuthSigninPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserModel**](UserModel.md)|  | [optional] 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthSingoutPost**
> apiAuthSingoutPost()



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new AuthApi();

try { 
    api_instance.apiAuthSingoutPost();
} catch (e) {
    print("Exception when calling AuthApi->apiAuthSingoutPost: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

