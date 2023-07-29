import 'package:currency_converter_app/constant.dart';
import 'package:currency_converter_app/models/Ratemodel.dart';
import 'package:currency_converter_app/models/allcurrencies.dart';
import 'package:http/http.dart' as http;

Future<Ratemodel> fetchrates() async {
  var res = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?app_id=$apikey'));

  final result = ratemodelFromJson(res.body);

  return result;
}

Future<Map> fetchcurrencies() async {
  var res = await http.get(
    Uri.parse(
        'https://openexchangerates.org/api/currencies.json?app_id=$apikey'),
  );
  final allcurrencies = allcurrenciesFromJson((res.body));

  return allcurrencies;
}

String convertany(
    Map rates, String amount, String initialcurrency, String finalcurrency) {
  String output =
      (double.parse(amount) / rates[initialcurrency] * rates[finalcurrency])
          .toStringAsFixed(2)
          .toString();
  return output;
}
