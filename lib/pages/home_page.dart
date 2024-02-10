


import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/todo_model.dart';

class LearnHTTP extends StatefulWidget {
  const LearnHTTP({Key? key}) : super(key: key);
  @override
  State<LearnHTTP> createState() => _LearnHTTPState();
}

class _LearnHTTPState extends State<LearnHTTP> {
  String text = "No Data";
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  final id = "1";
  Todo? todo;
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,id: id);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    //String baseUrl = "dummyjson.com",
    String? id,
  }){
    Uri uri = Uri.
    https(baseUrl,"$api${id != null ? "/$id" : ""}",);
    get(uri).then((respons){
      if(respons.statusCode == 200){
        final result = jsonDecode(respons.body);
        todo = Todo.fromJson(result);
      }else{
        text = "Someting error";
      }
      /// for consul
      final result = jsonDecode(respons.body);
      setState(() {});

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: todo != null ? ListTile(
            title: Text(todo!.title),
            subtitle: Text(todo!.body),
          ) : Text(text),
        ),
      ),
    );
  }
}


