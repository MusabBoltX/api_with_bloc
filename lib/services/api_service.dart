import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/data_model.dart';

class DoctorRepository {
  Future<List<DoctorsModel>> getDoctors() async {
    print("doctors 1");

    http.Response response = await http.get(Uri.http(
        "checkmb.us.tempcloudsite.com", "/musb/public/api/total_doctors"));

    print("doctors 2 ");
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(" --- response --- ");
      print(response.body);

      List<DoctorsModel> doctors =
          doctorsModelFromJson(response.body) as List<DoctorsModel>;

      return doctors.toList();
    } else {
      throw Exception();
    }
  }
}
