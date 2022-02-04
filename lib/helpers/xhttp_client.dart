import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class xHttpClient extends http.BaseClient {
  SharedPreferences sharedPref;
  xHttpClient({required this.sharedPref});

  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  Future<String> get userAccessToken async {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = await _loadTokenFromSharedPreference();

    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // intercept each call and add the Authorization header if token is available
    var token = await userAccessToken;
    if (token.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => token);
    }

    return request.send();
  }

  Future<String> _loadTokenFromSharedPreference() async {
    var accessToken = '';
    await sharedPref.reload();
    final userToken = sharedPref.getString("LOGGED_TOKEN");

    // If user is already authenticated, we can load his token from cache
    if (userToken != null) {
      accessToken = userToken;
    }
    return accessToken;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
