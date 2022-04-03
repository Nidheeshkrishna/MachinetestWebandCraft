import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_nidheeshkrishna/models/studentinfomodel.dart';

class StudentDetailPage extends StatelessWidget {
  final Studentinfomodel student;

  StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    double srcwidth = MediaQuery.of(context).size.width;
    double srcheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Detailes"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          ClipOval(
            child: Hero(
              tag: student.profileImage ?? "",
              child: CachedNetworkImage(
                imageUrl: student.profileImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: srcwidth,
            height: srcheight,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  //padding: const EdgeInsets.all(10.0),
                  child: Text(
                    student.name ?? "",
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  width: srcwidth,
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "userName:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        student.username ?? "",
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: srcwidth,
                  //alignment: Alignment.center,
                  //padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "EmailAddress:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        student.email ?? "",
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Address:",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                Container(
                  width: srcwidth * .50,
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.address!.city ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        student.address!.street ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        student.address!.suite ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        student.address!.zipcode ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Phone :\r\r",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      student.phone ?? "",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "WebSite :\r\r",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      student.website ?? "",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Company:",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                Container(
                  width: srcwidth * .50,
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.company!.name ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        student.company!.catchPhrase ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        student.company!.bs ?? "",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
