class ServerAddresses {
  //Server address of your project should go here
  static const serverAddress = 'https://woocommerce.openflutterproject.com/';
  //&consumer_key=ck_*****&consumer_secret=cs_**** goes here
  static const woocommerceKeys = '';
  static const categorySuffix = '/wp-json/wc/v3/products/categories/'; //id
  static const productSuffix = ' /wp-json/wc/v3/products/categories';
  static const signUp = ''; // TODO need an endpoint for this
  static const forgotPassword = ''; // TODO need an endpoint for this

  /// For more information about wp-rest-api plugin
  /// https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/
  static const authToken = 'wp-json/jwt-auth/v1/token';

  //CACHED API (for test purposes only)
  static const productCategories= '/cachedapi/v3/products/categories.json';
  static const products= '/cachedapi/v3/products/products.json';
}
