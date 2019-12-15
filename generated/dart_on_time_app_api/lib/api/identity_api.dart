part of swagger.api;



class IdentityApi {
  final ApiClient apiClient;

  IdentityApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Creates default admin user, this is added because we do not have a real database where to add this info.  We use an in memeory db so each time the service is restarted, this should be called
  ///
  /// 
  Future apiV1IdentityInitPost() async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Identity/init".replaceAll("{format}","json");

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
          ;
    } else {
      return ;
    }
  }
  /// Login user in the system
  ///
  /// 
  Future<AuthResponse> apiV1IdentityLoginPost({ UserLoginRequest body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Identity/login".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'AuthResponse') as AuthResponse ;
    } else {
      return null;
    }
  }
  /// Register a new user in the system
  ///
  /// 
  Future<AuthResponse> apiV1IdentityRegisterPost({ UserRegistrationRequest body }) async {
    Object postBody = body;

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Identity/register".replaceAll("{format}","json");

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
          apiClient.deserialize(response.body, 'AuthResponse') as AuthResponse ;
    } else {
      return null;
    }
  }
}
