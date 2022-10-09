import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instagram/people.dart';

class HomeModel extends GetxController {

  Future<People> imageHome(String type) async {
    final response = await http.get(
        Uri.parse(type.isEmpty
            ? 'https://api.pexels.com/v1/curated?per_page=80'
            : 'https://api.pexels.com/v1/search?per_page=80&query=$type'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 563492ad6f91700001000001615e94e989a249d28d6581a35e444715',
        });
    return peopleFromJson(response.body);
  }
}
