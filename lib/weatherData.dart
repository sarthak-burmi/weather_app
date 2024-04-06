// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=599c66cb7c7147b6a18151946230605&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    print(body);
    return Weather.fromJson(body);
  }

  // Future<Weather> getDataForLocation(String location) async {
  //   var uriCall = Uri.parse(
  //       'http://api.weatherapi.com/v1/current.json?key=599c66cb7c7147b6a18151946230605&q=$location&aqi=no');
  //   var response = await http.get(uriCall);
  //   var body = jsonDecode(response.body);
  //   return Weather.fromJson(body);
  // }

  // Future<List<String>> getLocationSuggestions(String query) async {
  //   var uriCall = Uri.parse(
  //       'http://api.weatherapi.com/v1/search.json?key=599c66cb7c7147b6a18151946230605&q=$query');
  //   var response = await http.get(uriCall);
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body) as List<dynamic>;
  //     List<String> suggestions =
  //         data.map((location) => location['name'] as String).toList();
  //     return suggestions;
  //   } else {
  //     throw Exception('Failed to load location suggestions');
  //   }
  // }
}
