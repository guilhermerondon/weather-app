import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  final String apiKey = 'aad444ff3a2c92e1a64956f5187491ca';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather?> fetchWeather(String city) async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Weather.fromJson(jsonResponse);
    } else {
      throw Exception('Falha ao carregar o clima');
    }
  }
}
