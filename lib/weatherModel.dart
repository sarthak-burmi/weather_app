// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names
class Weather {
  var cityName;
  var region;
  var icon;
  var customIconAsset;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_direction;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;
  Weather({
    required this.cityName,
    required this.region,
    required this.condition,
    required this.gust,
    required this.humidity,
    required this.icon,
    required this.last_update,
    required this.pressure,
    required this.pricipe,
    required this.temp,
    required this.uv,
    required this.wind,
    required this.wind_direction,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    region = json['location']['region'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_direction = json['current']['wind_dir'];
    pressure = json['current']['pressure_mb'];
    pricipe = json['current']['precip_mm'];
    last_update = json['current']['last_updated'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];

    // customIconAsset = mapConditionToCustomIcon(condition);
  }
  // String mapConditionToCustomIcon(String conditionText) {
  //   print("Condition Text: $conditionText");
  //   switch (conditionText) {
  //     case 'Patchy rain possible':
  //       return 'assets/images/patchy rain possible-icon.png'; // Replace with your custom clear weather icon asset path
  //     case 'Mist':
  //       return 'assets/images/mist.png';
  //     case 'Overcast':
  //       return 'assets/images/overcast.png';
  //     case 'Clear':
  //       return 'assets/images/sun.png';
  //     case 'Light rain':
  //       return 'assets/images/light-rain.png';
  //     case 'Partly cloudy':
  //       return 'assets/images/Partly cloudy.png';
  //     case 'Moderate rain':
  //       return 'assets/images/light-rain.png';
  //     case 'Sunny':
  //       return 'assets/images/sun.png';
  //     case ' Moderate or heavy rain with thunder':
  //       return 'assets/images/thunderstorm.png';

  //     default:
  //       return 'assets/images/sun.png';
  //   }
  // }
}
