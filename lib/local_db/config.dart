class OpenFlutterDatabaseConfig {
  static const String databaseName = 'openflutterdatabase19.db';
  static const int databaseVersion = 1;
  static const createTablesQueries = [
    'CREATE TABLE IF NOT EXISTS Product(id INTEGER PRIMARY KEY, title TEXT, image TEXT, thumb TEXT, price REAL, discountPercent REAL, categoryId INTEGER, amount INTEGER, description TEXT, isFavourite NUMERIC, rating REAL, rating1Count INTEGER, rating2Count INTEGER, rating3Count INTEGER, rating4Count INTEGER, rating5Count INTEGER)',
    'CREATE TABLE IF NOT EXISTS Product2Parameter(id INTEGER PRIMARY KEY, productParameterId INTEGER, productId INTEGER)',
    'CREATE TABLE IF NOT EXISTS ProductParameter(id INTEGER PRIMARY KEY, title TEXT)',
    'CREATE TABLE IF NOT EXISTS ProductParameterVariant(id INTEGER PRIMARY KEY, title TEXT, productParameterId INTEGER, additionalPrice REAL)',
    'CREATE TABLE IF NOT EXISTS ProductImage(id INTEGER PRIMARY KEY, title TEXT, thumb TEXT, image TEXT)',
    'CREATE TABLE IF NOT EXISTS ProductCategory(id INTEGER PRIMARY KEY, title TEXT, description TEXT, image TEXT, thumb TEXT, parentId INTEGER DEFAULT 0)',
    'CREATE TABLE IF NOT EXISTS ProductReview(id INTEGER PRIMARY KEY, description TEXT, productId INTEGER, rating REAL, hasPhoto NUMERIC, date NUMERIC, author TEXT, thumb TEXT)',
    'CREATE TABLE IF NOT EXISTS ProductReviewPhoto(id INTEGER PRIMARY KEY, image TEXT, reviewId INTEGER)',
    'CREATE TABLE IF NOT EXISTS HashTag(id INTEGER PRIMARY KEY, title TEXT)',
    'CREATE TABLE IF NOT EXISTS ProductHashTag(id INTEGER PRIMARY KEY, hashTagId INTEGER, productId INTEGER)',
    'CREATE TABLE IF NOT EXISTS CategoryHashTag(id INTEGER PRIMARY KEY, hashTagId INTEGER, categoryId INTEGER)',
    'CREATE TABLE IF NOT EXISTS User(id INTEGER PRIMARY KEY, name TEXT, avatar TEXT, email TEXT, password TEXT, birthDate NUMERIC, salesNotification NUMERIC, newArrivalsNotification NUMERIC, deliveryStatusChanges NUMERIC)',
    'CREATE TABLE IF NOT EXISTS ShippingAddress(id INTEGER PRIMARY KEY, title TEXT, address TEXT, city TEXT, country TEXT, postal TEXT, isDefault NUMERIC)',
    'CREATE TABLE IF NOT EXISTS ProductCart(id INTEGER PRIMARY KEY, productId INTEGER, productCount INTEGER, totalPrice REAL)',
    'CREATE TABLE IF NOT EXISTS PromoCode(id INTEGER PRIMARY KEY, title TEXT, image TEXT, promoCode TEXT, discountPercent REAL, belongsToUser NUMERIC, wasUsed NUMERIC)',
    'CREATE TABLE IF NOT EXISTS DeliveryMethod(id INTEGER PRIMARY KEY, title TEXT, price REAL)',
    'CREATE TABLE IF NOT EXISTS UserOrder(id INTEGER PRIMARY KEY, orderNumber INTEGER, trackingNumber TEXT, productCount INTEGER, promoCodeId INTEGER, discountPercent REAL, discountTitle TEXT, shippingAddressId INTEGER, orderStatus TEXT, totalAmount REAL, deliveryMethodId INTEGER, deliveryPrice REAL)',
    'CREATE TABLE IF NOT EXISTS OrderProduct(id INTEGER PRIMARY KEY, productId INTEGER, productCount INTEGER, totalPrice REAL, title TEXT, discountPercent REAL, thumb TEXT)',
    'CREATE TABLE IF NOT EXISTS OrderProductParameter(id INTEGER PRIMARY KEY, productId INTEGER, parameterId INTEGER, parameterValueId INTEGER)'
  ];
}
