import 'package:http/http.dart' as http;
import 'dart:convert';

Future getdata() async {
  try {
    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    final data = jsonDecode(res.body);
    print(data['products'][0]['id']);
  } catch (e) {
    throw e.toString();
  }
}
