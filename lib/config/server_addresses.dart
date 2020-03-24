class ServerAddresses {
  static const SERVER_ADDRESS = '';
  static const CATEGORY_SUFFIX = '/wp-json/wc/v3/products/categories/'; //id
  static const PRODUCT_SUFFIX = ' /wp-json/wc/v3/products/categories';
  static const SIGN_UP = ''; // TODO need an endpoint for this
  static const FORGOT_PASSWORD = ''; // TODO need an endpoint for this

  /// For more information about wp-rest-api plugin
  /// https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/
  static const AUTH_TOKEN = 'wp-json/jwt-auth/v1/token';
}
