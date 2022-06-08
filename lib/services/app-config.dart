class AppConfig {
  static const String _apiUrl = "http://www.comicvine.com/api";
  static const String _apiKey = "070a2a4f8eda9add96a5c5888d5a64cc7ee44f31";

  static final Map<String, String> headerParams = {
    'Content-Type': 'application/json'
  };

  static String url(String path) {
    return '$_apiUrl$path/?api_key=$_apiKey';
  }

  static String getApiKey() {
    return _apiKey;
  }
}
