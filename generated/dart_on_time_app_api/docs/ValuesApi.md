# swagger.api.ValuesApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiValuesGet**](ValuesApi.md#apiValuesGet) | **Get** /api/Values | 
[**apiValuesIdDelete**](ValuesApi.md#apiValuesIdDelete) | **Delete** /api/Values/:id | Delete one value
[**apiValuesIdGet**](ValuesApi.md#apiValuesIdGet) | **Get** /api/Values/:id | 
[**apiValuesIdPut**](ValuesApi.md#apiValuesIdPut) | **Put** /api/Values/:id | 
[**apiValuesPost**](ValuesApi.md#apiValuesPost) | **Post** /api/Values | 


# **apiValuesGet**
> List<String> apiValuesGet()



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();

try { 
    var result = api_instance.apiValuesGet();
    print(result);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesIdDelete**
> apiValuesIdDelete(id)

Delete one value

### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var id = 56; // int | The id of the value to remove

try { 
    api_instance.apiValuesIdDelete(id);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesIdDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The id of the value to remove | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesIdGet**
> String apiValuesIdGet(id)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var id = 56; // int | 

try { 
    var result = api_instance.apiValuesIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesIdPut**
> apiValuesIdPut(id, body)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var id = 56; // int | 
var body = new String(); // String | 

try { 
    api_instance.apiValuesIdPut(id, body);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesIdPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **body** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesPost**
> apiValuesPost(body)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var body = new String(); // String | 

try { 
    api_instance.apiValuesPost(body);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

