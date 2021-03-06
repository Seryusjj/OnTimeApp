part of swagger.api;



class CheckInRecordsApi {
  final ApiClient apiClient;

  CheckInRecordsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<CheckInResponseResponseSet> apiV1CheckInRecordsEmailDateGet(String email, DateTime date) async {
    Object postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }
    if(date == null) {
     throw new ApiException(400, "Missing required param: date");
    }

    // create path and map variables
    String path = "/api/v1/CheckInRecords/{email}/{date}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString()).replaceAll("{" + "date" + "}", date.toString());

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
          apiClient.deserialize(response.body, 'CheckInResponseResponseSet') as CheckInResponseResponseSet ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CheckInResponseResponseSet> apiV1CheckInRecordsEmailFromToGet(String email, DateTime from, DateTime to) async {
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
    String path = "/api/v1/CheckInRecords/{email}/{from}/{to}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString()).replaceAll("{" + "from" + "}", from.toString()).replaceAll("{" + "to" + "}", to.toString());

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
          apiClient.deserialize(response.body, 'CheckInResponseResponseSet') as CheckInResponseResponseSet ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CheckInResponseResponseSet> apiV1CheckInRecordsEmailGet(String email) async {
    Object postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }

    // create path and map variables
    String path = "/api/v1/CheckInRecords/{email}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString());

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
          apiClient.deserialize(response.body, 'CheckInResponseResponseSet') as CheckInResponseResponseSet ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CheckInResponseResponseSet> apiV1CheckInRecordsGet() async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/CheckInRecords".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'CheckInResponseResponseSet') as CheckInResponseResponseSet ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CheckInResponse> apiV1CheckInRecordsRegisterPost({ CheckInResgistrationRequest body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/CheckInRecords/Register".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'CheckInResponse') as CheckInResponse ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<WorkedTimeResponse> apiV1CheckInRecordsWorkedTimeEmailDateGet(String email, DateTime date) async {
    Object postBody = null;

    // verify required params are set
    if(email == null) {
     throw new ApiException(400, "Missing required param: email");
    }
    if(date == null) {
     throw new ApiException(400, "Missing required param: date");
    }

    // create path and map variables
    String path = "/api/v1/CheckInRecords/WorkedTime/{email}/{date}".replaceAll("{format}","json").replaceAll("{" + "email" + "}", email.toString()).replaceAll("{" + "date" + "}", date.toString());

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
          apiClient.deserialize(response.body, 'WorkedTimeResponse') as WorkedTimeResponse ;
    } else {
      return null;
    }
  }
}
