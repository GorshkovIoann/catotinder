import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat_model.dart';

class CatService {
  // URL с параметрами и вашим API-ключом
  static const String apiUrl =
      'https://api.thecatapi.com/v1/images/search?has_breeds=1&api_key=live_NYFf8Gz7DAv5YHdih8vdWSHCjEKQsVePWieuZa1aSHO7VCOchCNya2bSgRkrsesZ';

  Future<Cat?> fetchRandomCat() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List && data.isNotEmpty) {
        return Cat.fromJson(data[0]);
      } else {}
    } else {}
    return null;
  }
}
