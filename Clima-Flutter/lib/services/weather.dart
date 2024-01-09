import 'location.dart';
import 'networking.dart';

const apiKey = "7K27ELZJEJFLA4A6MYL88JMJA";
const url =
    "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";

class WeatherModel {
  var data;
  var today;
  var days_15 = []; // 15 days forecast
  String? condition;
  var descriptions = [];
  var conditions = [];
  String? description;
  String? timezone;
  var city;
  // double? temp_today_in_F;
  double? temp;
  var icon;
  var icons = [];

  getWeatherData() async {
    Location locator = Location();
    await locator.getPermission();
    await locator.getCurrentLocation();
    String? latitude = locator.latitude?.toStringAsFixed(3);
    String? longitude = locator.longitude?.toStringAsFixed(3);

    NetworkHelper networkHelper = NetworkHelper();

    var uri = "$url/$latitude,$longitude?key=$apiKey&unitGroup=uk";
    data = await networkHelper.fetch(uri);

    days_15 = data['days'];
    today = days_15[0];
    timezone = data['timezone'];
    city = timezone?.split("/");
    city = city[(city.length - 1)];
    // temp_today_in_F = days_15[0]['temp'];    added 'unitGroup=uk' in the url params to get the temperature in C.
    // temp = ((days_15[0]['temp']-32)*5/9*10).round()/10;
    temp = days_15[0]['temp'];
    description = getMessage(temp!.toInt());
    condition = today['conditions'].toLowerCase();
    icon = getWeatherIcon(condition);

    // print("gotcha!");
    // for (var day in days_15) {
    //   icons.insert(icons.length, day['icon']);
    //   descriptions.insert(descriptions.length, day['description']);
    //   conditions.insert(conditions.length, day['condition']);
    // }
  }

  getCityData(String? cityName) async{
    NetworkHelper networkHelper = NetworkHelper();
    var uri = "$url/$cityName?key=$apiKey&unitGroup=uk";
    data = await networkHelper.fetch(uri);
    if (data == null) return;

    city = cityName;
    today = data['days'][0];
    temp = data['days'][0]['temp'];
    description = getMessage(temp!.toInt());
    condition = today['conditions'].toLowerCase();
    icon = getWeatherIcon(condition);
    // print("\n\n$temp\n\n$city\n\n$icon\n\n$description\n\n$today");

  }

  String getWeatherIcon(String? condition) {
    if (condition!.contains('lightning') || condition.contains('thunder')) {
      return '🌩';
    } else if (condition.contains("light")) {
      return '☔️';
    } else if (condition.contains("rain")) {
      return '🌧';
    } else if (condition.contains("snow") || condition.contains('frost')) {
      return '☃️';
    } else if (condition.contains('fog') || condition.contains('mist')) {
      return '🌫';
    } else if (condition.contains('clear') || condition.contains('sun')) {
      return '☀️';
    } else if (condition.contains('partia')){
      return '🌤️';
    } else if (condition.contains('cloud') || condition.contains('overcast')) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
