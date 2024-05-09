class ApiInstance {
  String baseUrl = "https://bb9d-180-248-26-61.ngrok-free.app/api/v1";
  String pathUrl(String path) => "$baseUrl$path";
}
