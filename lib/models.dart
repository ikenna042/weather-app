/* 
  {
    "weather":[
      {
        "description":"broken clouds",
        "icon":"04n"
      }
    ],
    "main":{
      "temp":296.07,
    },
    "name":"Enugu"
  }
 */

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temp;

  TemperatureInfo({this.temp});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];

    return TemperatureInfo(temp: temp);
  }
}

class WeatherResponse {
  final String cityName;
  final WeatherInfo weatherInfo;
  final TemperatureInfo temperatureInfo;

  String get iconUrl {
    // http://openweathermap.org/img/wn/10d@2x.png
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({this.cityName, this.weatherInfo, this.temperatureInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final weatherJson = json['weather'][0];
    final weather = WeatherInfo.fromJson(weatherJson);
    final tempJson = json['main'];
    final temp = TemperatureInfo.fromJson(tempJson);
    return WeatherResponse(
        cityName: cityName, weatherInfo: weather, temperatureInfo: temp);
  }
}
