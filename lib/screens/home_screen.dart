// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Weather? _weather;
  final WeatherService _weatherService = WeatherService();

  void _getWeather() async {
    final city = _controller.text;
    try {
      final weather = await _weatherService.fetchWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getWeather,
              child: Text('Obter Clima'),
            ),
            SizedBox(height: 20),
            if (_weather != null) ...[
              Text(
                'Cidade: ${_weather!.cityName}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Temperatura: ${_weather!.temperature} °C',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Descrição: ${_weather!.description}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
