import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_nidheeshkrishna/bloc/studentbloc_bloc.dart';
import 'package:machine_test_nidheeshkrishna/bloc/studentbloc_state.dart';
import 'package:machine_test_nidheeshkrishna/models/studentinfomodel.dart';
import 'package:machine_test_nidheeshkrishna/pages/article_detail_page.dart';
import 'package:machine_test_nidheeshkrishna/studentRepository/studentreposervice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StudentblocBloc? articleBloc;
  StudentRepository? repository;

  @override
  void initState() {
    super.initState();
    //var blocProvider = BlocProvider;
    articleBloc = BlocProvider.of(context);
    //articleBloc!.add(FetchArticlesEvent());
    BlocProvider.of<StudentblocBloc>(context).add(FetchStudentEvent());
    //RepositoryProvider.of<ConnectivityService>(context);
    //  squareBloc = SquareBloc(homeRepo);
    // squareBloc.add(FetchSquares(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Students Info"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                articleBloc!.add(FetchStudentEvent());
              },
            ),
            // IconButton(
            //   icon: const Icon(Icons.info),
            //   onPressed: () {
            //     //navigateToAoutPage(context);
            //   },
            // )
          ],
        ),
        body: BlocConsumer<StudentblocBloc, StudentblocState>(
            listener: (context, state) {
          if (state is StudentErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(milliseconds: 300),
              ),
            );
          }
        }, builder: (context, state) {
          if (state is StudentInitialState) {
            return buildLoading();
          } else if (state is StudentLoadingState) {
            return buildLoading();
          } else if (state is StudentLoadedState) {
            return buildArticleList(state.articles);
          } else if (state is StudentErrorState) {
            return buildErrorUi(state.message);
          } else {
            return Container();
          }
        }));
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<Studentinfomodel> studentsinfo) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: studentsinfo.length,
      itemBuilder: (ctx, pos) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: ListTile(
                leading: ClipOval(
                  child: Hero(
                    tag: studentsinfo[pos].profileImage ?? "",
                    child: CachedNetworkImage(
                      imageUrl: studentsinfo[pos].profileImage ?? "",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                title: Text(studentsinfo[pos].name ?? ""),
                // subtitle: studentsinfo[pos].company!.name != null
                //     ? Text(studentsinfo[pos].company!.name ?? "")
                //     : Container()),
                onTap: () {
                  navigateToArticleDetailPage(context, studentsinfo[pos]);
                },
              ),
            ));
      },
    );
  }

  void navigateToArticleDetailPage(
      BuildContext context, Studentinfomodel article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StudentDetailPage(
        student: article,
      );
    }));
  }

  // void navigateToAoutPage(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return AboutPage();
  //   }));
  // }
}
