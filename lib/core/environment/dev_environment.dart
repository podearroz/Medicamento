import 'package:flutter_application_medicamento/core/configs/environment.dart';

class DevEnvironment extends Environment {
  DevEnvironment()
      : super(
            isProduction: false,
            name: "Development",
            apiUrl: 'http://localhost:3000');
}
