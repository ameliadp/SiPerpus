class URL {
  static String host = "https://e3b1-66-96-237-58.ngrok-free.app";
  static String baseUrl = '$host/api';
  static String loginUrl = '$baseUrl/login';
  static String registerUrl = '$baseUrl/register';
  static String booksUrl = '$baseUrl/books';
  static String popularBooksUrl = '$baseUrl/popular-books';
  static String categoriesUrl = '$baseUrl/category';
  static String profileUrl = '$baseUrl/profile';
  static String borrowingUrl = '$baseUrl/borrowing';
  static String returnBookUrl = '$baseUrl/return';
  static String reviewUrl = '$baseUrl/review';
  static String totalFineUrl = '$baseUrl/total-fine';
  static String imageUrl(String path) => '$host$path';
}
