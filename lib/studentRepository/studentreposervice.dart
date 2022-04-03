import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:machine_test_nidheeshkrishna/models/studentinfomodel.dart';
import 'package:path_provider/path_provider.dart';

abstract class StudentRepository {
  Future<List<Studentinfomodel>> getArticles();
}

class StudentRepositoryImpl implements StudentRepository {
  bool kDebugMode = true;

  @override
  Future<List<Studentinfomodel>> getArticles() async {
    String filename = "studentinfo.json";
    var dir = await getTemporaryDirectory();

    File file = File(dir.path + "/" + filename);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      final List<Studentinfomodel> studentscache =
          studentinfomodelFromJson(jsonData);
      return studentscache;
    } else {
      var response = await http
          .get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
      if (response.statusCode == 200) {
        // var data = json.decode(response.body);
        // print("data from api" + data);
        final List<Studentinfomodel> students =
            studentinfomodelFromJson(response.body);
        file.writeAsStringSync(response.body,
            flush: true, mode: FileMode.write);
        return students;
      } else {
        throw Exception();
      }
    }
  }
}
