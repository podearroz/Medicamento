abstract class Environment {
  final bool isProduction;
  final String apiUrl;
  final String name;

  Environment({
    required this.isProduction,
    required this.apiUrl,
    required this.name,
  });
}
