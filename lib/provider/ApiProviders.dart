
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/model/people.dart';
import 'package:instagram/service/ApiService.dart';

final userDataProvider = FutureProvider.family<People,String>((ref,type) async {
  return ref.read(apiProvider).getUser(type);
});