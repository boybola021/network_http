

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:network_http/models/movies_model.dart';
import 'package:network_http/pages/leading_page.dart';
import 'package:network_http/servise/network_servise.dart';

import 'error_page.dart';

/// 3

class DetailPage extends StatelessWidget {
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: NetworkTeach.methodGet(api: NetworkMovie.apiMovies,id: id),
      initialData: "No Data",
      builder: (context,snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none: return const ErrorPage(message: "No Data");
          case ConnectionState.waiting: return const LoadingPage();
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return DeatilSuccessPage(data: snapshot.data!);
            } else {
              return const ErrorPage(
                  message:
                  "Something error, Please check your internet connecting!");
            }
          case ConnectionState.active: continue done;
        }
      },
    );
  }
}

class DeatilSuccessPage extends StatelessWidget {
  final String data;
  const DeatilSuccessPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = NetworkTeach.parseMovie(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.movie),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text("$movie",
        style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}


/*
class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Movie? movie;


  @override
  void initState() {
    super.initState();
    fetchData(widget.id);
  }

  void fetchData(int id)async{
    final data = await Network.methodGet(api: NetworkTeach.apiMovies, id: id);
    log(data!);
    movie = NetworkTeach.parseMovie(data!);

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return movie != null ? Scaffold(
      appBar: AppBar(
        title: Text(movie!.movie),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
      ),
    ) : const Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}
*/