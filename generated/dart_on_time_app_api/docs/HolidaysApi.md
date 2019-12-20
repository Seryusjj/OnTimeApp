# swagger.api.HolidaysApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1HolidaysApprovePost**](HolidaysApi.md#apiV1HolidaysApprovePost) | **POST** /api/v1/Holidays/Approve | Approve an existing Holiday request
[**apiV1HolidaysDeletePost**](HolidaysApi.md#apiV1HolidaysDeletePost) | **POST** /api/v1/Holidays/Delete | Delete an existing Holiday request
[**apiV1HolidaysEmailFromToGet**](HolidaysApi.md#apiV1HolidaysEmailFromToGet) | **GET** /api/v1/Holidays/{email}/{from}/{to} | Get a set of request that belong to the user with the passed email between the years from and to
[**apiV1HolidaysRegisterPost**](HolidaysApi.md#apiV1HolidaysRegisterPost) | **POST** /api/v1/Holidays/Register | Register a new leave request
[**apiV1HolidaysToApproveEmailGet**](HolidaysApi.md#apiV1HolidaysToApproveEmailGet) | **GET** /api/v1/Holidays/ToApprove/{email} | Get the Holiday requests that the user has to approve


# **apiV1HolidaysApprovePost**
> HolidayRequestResponse apiV1HolidaysApprovePost(body)

Approve an existing Holiday request

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new HolidaysApi();
var body = new HolidayApproveRequest(); // HolidayApproveRequest | 

try { 
    var result = api_instance.apiV1HolidaysApprovePost(body);
    print(result);
} catch (e) {
    print("Exception when calling HolidaysApi->apiV1HolidaysApprovePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**HolidayApproveRequest**](HolidayApproveRequest.md)|  | [optional] 

### Return type

[**HolidayRequestResponse**](HolidayRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1HolidaysDeletePost**
> HolidayRequestResponse apiV1HolidaysDeletePost(body)

Delete an existing Holiday request

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new HolidaysApi();
var body = new HolidayDeleteRequest(); // HolidayDeleteRequest | 

try { 
    var result = api_instance.apiV1HolidaysDeletePost(body);
    print(result);
} catch (e) {
    print("Exception when calling HolidaysApi->apiV1HolidaysDeletePost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**HolidayDeleteRequest**](HolidayDeleteRequest.md)|  | [optional] 

### Return type

[**HolidayRequestResponse**](HolidayRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1HolidaysEmailFromToGet**
> HolidayRequestResponseResponseSet apiV1HolidaysEmailFromToGet(email, from, to)

Get a set of request that belong to the user with the passed email between the years from and to

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new HolidaysApi();
var email = email_example; // String | Owner email
var from = 56; // int | From year
var to = 56; // int | To year

try { 
    var result = api_instance.apiV1HolidaysEmailFromToGet(email, from, to);
    print(result);
} catch (e) {
    print("Exception when calling HolidaysApi->apiV1HolidaysEmailFromToGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**| Owner email | 
 **from** | **int**| From year | 
 **to** | **int**| To year | 

### Return type

[**HolidayRequestResponseResponseSet**](HolidayRequestResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1HolidaysRegisterPost**
> HolidayRequestResponse apiV1HolidaysRegisterPost(body)

Register a new leave request

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new HolidaysApi();
var body = new HolidayRequestRegistration(); // HolidayRequestRegistration | 

try { 
    var result = api_instance.apiV1HolidaysRegisterPost(body);
    print(result);
} catch (e) {
    print("Exception when calling HolidaysApi->apiV1HolidaysRegisterPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**HolidayRequestRegistration**](HolidayRequestRegistration.md)|  | [optional] 

### Return type

[**HolidayRequestResponse**](HolidayRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1HolidaysToApproveEmailGet**
> HolidayRequestResponseResponseSet apiV1HolidaysToApproveEmailGet(email)

Get the Holiday requests that the user has to approve

### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new HolidaysApi();
var email = email_example; // String | The manager email

try { 
    var result = api_instance.apiV1HolidaysToApproveEmailGet(email);
    print(result);
} catch (e) {
    print("Exception when calling HolidaysApi->apiV1HolidaysToApproveEmailGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**| The manager email | 

### Return type

[**HolidayRequestResponseResponseSet**](HolidayRequestResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

