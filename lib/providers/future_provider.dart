import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/api_service.dart';
import 'package:riverpod_practice/user_data.dart';

final apiProvider = Provider<ApiSevice>((ref) => ApiSevice());

final userDataProvider = FutureProvider<List<User>>((ref) {
return ref.read(apiProvider).getUser();
});
