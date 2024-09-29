import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/loading_widget.dart';
import '../providers/weather_provider.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (weatherProvider.isLoading)
              LoadingWidget() // Widget de carregamento
            else if (weatherProvider.currentWeather != null)
              Column(
                children: [
                  Text(
                    weatherProvider.currentWeather!.cityName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${weatherProvider.currentWeather!.temperature}°C',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(weatherProvider.currentWeather!.description),
                ],
              )
            else if (weatherProvider.errorMessage.isNotEmpty)
              Text(weatherProvider.errorMessage),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                weatherProvider.fetchWeather(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
