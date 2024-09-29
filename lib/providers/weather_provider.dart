import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _currentWeather;
  bool _isLoading = false;
  String _errorMessage = '';

  Weather? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _currentWeather = await WeatherService().fetchWeather(city);
    } catch (e) {
      _errorMessage = 'Falha ao carregar o clima';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
