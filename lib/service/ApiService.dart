import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/model/people.dart';

class ApiService {

  Future<People> getUser(String type) async {
    final response = await http.get(
        Uri.parse(type.isEmpty
            ? 'https://api.pexels.com/v1/curated?per_page=80'
            : 'https://api.pexels.com/v1/search?per_page=80&query=$type'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 563492ad6f91700001000001615e94e989a249d28d6581a35e444715',
        });

    if (response.statusCode == 200) {
      return peopleFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiProvider = Provider<ApiService>((ref) => ApiService());
