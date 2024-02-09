class URL {
  static String host = "https://story-api.dicoding.dev";
  static String mapsUrl =
      "https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}.png";
  static String mapsApiKey = "f7271e80-7128-4ff3-af79-60224df92bd6";
  static String version = "/v1";
  static String baseUrl = '$host/$version';
  static String registerUrl = '/register';
  static String loginUrl = '/login';
  static String storiesUrl = '/stories';
  static String storiesGuestUrl = '$storiesUrl/guest';
}
