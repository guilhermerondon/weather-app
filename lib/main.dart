import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/weather_page.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherPage(),
      ),
    );
  }
}
