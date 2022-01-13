// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:news_app/models/data_model.dart';

class DoctorRepository {
  Future<List<DoctorsModel>> getDoctors() async {
    http.Response response = await http.get(Uri.http(
        "checkmb.us.tempcloudsite.com", "/musb/public/api/total_doctors"));

    if (response.statusCode == 200) {
      print(response.body);

      List<DoctorsModel> doctors =
          doctorsModelFromJson(response.body) as List<DoctorsModel>;

      return doctors;
    } else {
      throw Exception();
    }
  }
}
