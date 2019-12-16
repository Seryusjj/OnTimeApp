# swagger.api.CheckInRecordsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1CheckInRecordsEmailDateGet**](CheckInRecordsApi.md#apiV1CheckInRecordsEmailDateGet) | **GET** /api/v1/CheckInRecords/{email}/{date} | 
[**apiV1CheckInRecordsEmailGet**](CheckInRecordsApi.md#apiV1CheckInRecordsEmailGet) | **GET** /api/v1/CheckInRecords/{email} | 
[**apiV1CheckInRecordsGet**](CheckInRecordsApi.md#apiV1CheckInRecordsGet) | **GET** /api/v1/CheckInRecords | 


# **apiV1CheckInRecordsEmailDateGet**
> CheckInResponseResponseSet apiV1CheckInRecordsEmailDateGet(email, date)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CheckInRecordsApi();
var email = email_example; // String | 
var date = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.apiV1CheckInRecordsEmailDateGet(email, date);
    print(result);
} catch (e) {
    print("Exception when calling CheckInRecordsApi->apiV1CheckInRecordsEmailDateGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 
 **date** | **DateTime**|  | 

### Return type

[**CheckInResponseResponseSet**](CheckInResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1CheckInRecordsEmailGet**
> CheckInResponseResponseSet apiV1CheckInRecordsEmailGet(email)



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CheckInRecordsApi();
var email = email_example; // String | 

try { 
    var result = api_instance.apiV1CheckInRecordsEmailGet(email);
    print(result);
} catch (e) {
    print("Exception when calling CheckInRecordsApi->apiV1CheckInRecordsEmailGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**CheckInResponseResponseSet**](CheckInResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1CheckInRecordsGet**
> CheckInResponseResponseSet apiV1CheckInRecordsGet()



### Example 
```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CheckInRecordsApi();

try { 
    var result = api_instance.apiV1CheckInRecordsGet();
    print(result);
} catch (e) {
    print("Exception when calling CheckInRecordsApi->apiV1CheckInRecordsGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CheckInResponseResponseSet**](CheckInResponseResponseSet.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

