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
> apiValuesGet()



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();

try { 
    api_instance.apiValuesGet();
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesGet: $e\n");
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

# **apiValuesIdDelete**
> apiValuesIdDelete(id)

Delete one value

### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var id = ; // Object | The id of the value to remove

try { 
    api_instance.apiValuesIdDelete(id);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesIdDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Object**](.md)| The id of the value to remove | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesIdGet**
> apiValuesIdGet(id)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var id = ; // Object | 

try { 
    api_instance.apiValuesIdGet(id);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Object**](.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesIdPut**
> apiValuesIdPut(id)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();
var id = ; // Object | 

try { 
    api_instance.apiValuesIdPut(id);
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesIdPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Object**](.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiValuesPost**
> apiValuesPost()



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new ValuesApi();

try { 
    api_instance.apiValuesPost();
} catch (e) {
    print("Exception when calling ValuesApi->apiValuesPost: $e\n");
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

