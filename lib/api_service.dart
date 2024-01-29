import 'package:dio/dio.dart';
import 'package:riverpod_practice/user_data.dart';

class ApiSevice {
  String endpoint = "https://reqres.in/api/users?page=1";

  Future<List<User>> getUser() async {
    final response = await Dio().get(endpoint);

    if (response.statusCode == 200) {
      print('called');
       print(response.data);
      UserData userData = UserData.fromJson(response.data);
     
      return userData.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
