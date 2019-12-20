part of swagger.api;



class HolidaysApi {
  final ApiClient apiClient;

  HolidaysApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Approve an existing Holiday request
  ///
  /// 
  Future<HolidayRequestResponse> apiV1HolidaysApprovePost({ HolidayApproveRequest body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Holidays/Approve".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'HolidayRequestResponse') as HolidayRequestResponse ;
    } else {
      return null;
    }
  }
  /// Delete an existing Holiday request
  ///
  /// 
  Future<HolidayRequestResponse> apiV1HolidaysDeletePost({ HolidayDeleteRequest body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Holidays/Delete".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'HolidayRequestResponse') as HolidayRequestResponse ;
    } else {
      return null;
    }
  }
  /// Get a set of request that belong to the user with the passed email between the years from and to
  ///
  /// 
  Future<HolidayRequestResponseResponseSet> apiV1HolidaysEmailFromToGet(String email, int from, int to) async {
    Object postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }
    if(from == null) {
     throw new ApiException(400, "Missing required param: from");
    }
    if(to == null) {
     throw new ApiException(400, "Missing required param: to");
    }

    // create path and map variables
    String path = "/api/v1/Holidays/{email}/{from}/{to}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString()).replaceAll("{" + "from" + "}", from.toString()).replaceAll("{" + "to" + "}", to.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'HolidayRequestResponseResponseSet') as HolidayRequestResponseResponseSet ;
    } else {
      return null;
    }
  }
  /// Register a new leave request
  ///
  /// 
  Future<HolidayRequestResponse> apiV1HolidaysRegisterPost({ HolidayRequestRegistration body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Holidays/Register".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'HolidayRequestResponse') as HolidayRequestResponse ;
    } else {
      return null;
    }
  }
  /// Get the Holiday requests that the user has to approve
  ///
  /// 
  Future<HolidayRequestResponseResponseSet> apiV1HolidaysToApproveEmailGet(String email) async {
    Object postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/v1/Holidays/ToApprove/{email}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Bearer"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'HolidayRequestResponseResponseSet') as HolidayRequestResponseResponseSet ;
    } else {
      return null;
    }
  }
}
