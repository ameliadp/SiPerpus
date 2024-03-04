class URL {
  static String host = "https://a9a1-103-108-20-102.ngrok-free.app";
  static String baseUrl = '$host/api';
  static String loginUrl = '$baseUrl/login';
  static String registerUrl = '$baseUrl/register';
  static String booksUrl = '$baseUrl/books';
  static String popularBooksUrl = '$baseUrl/popular-books';
  static String categoriesUrl = '$baseUrl/category';
  static String profileUrl = '$baseUrl/profile';
  static String updateProfileUrl = '$baseUrl/profile/update';
  static String borrowingUrl = '$baseUrl/borrowing';
  static String returnBookUrl = '$baseUrl/return';
  static String reviewUrl = '$baseUrl/review';
  static String totalFineUrl = '$baseUrl/total-fine';
  static String imageUrl(String path) => '$host$path';
  static String collectionsUrl = '$baseUrl/collections';
  static String deleteCollectionUrl(String collectionId) =>
      '$collectionsUrl/delete/$collectionId';
  static String defaultQRUrl = 'https://i.postimg.cc/yNLdwSbX/qr.png';
}
