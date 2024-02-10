

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:network_http/models/hub_product_model.dart';

import '../models/movies_model.dart';
import '../models/product_models.dart';
import '../models/quolts.dart';
import '../models/user_model.dart';



class Network {
  /// DOMAIN
  static const baseUrl = "dummyjson.com";

  /// APIS
  static const apiQuotes = "/quotes";
  static const apiProducts = "/products";
  static const apiComments = "/products";

  /// METHODS
  static Future<String?> methodGet({required String api, int? id,String url = "dummyjson.com"}) async {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// PARSING
  static List<Quote> parseQuoteList(String data) {
    final List result = jsonDecode(data)["quotes"];
    final items = result.map((json) => Quote.fromJson(json)).toList();
    return items;
  }
  static List<Product> parseProductList(String data) {
    final List result = jsonDecode(data)["products"];
    final items = result.map((json) => Product.fromJson(json)).toList();
    return items;
  }
}



class NetworkMovie{
  /// DOMAIN
  static const String baseUrl = "dummyapi.online";

  /// APIS
  static const apiMovies = "/api/movies";

 /// headers

  static const Map<String,String> header = {
    "Content-Type": "application/json",
  };

  static Future<String?> methodGet({
    required String api,
    int? id, Map<String,
    String> headers = header
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url, headers: headers);
      if(response.statusCode == 200) {
        return response.body;
      }
    } catch(e) {
      return null;
    }
  }

  static List<Movies> parseMoviesList(String data){
    final List jsone = jsonDecode(data);
    return jsone.map((item) => Movies.fromJson(item)).toList();
  }
}


class NetworkHub{
  /// DOMAIN
  static const String baseUrl = "hub.dummyapis.com";

  /// APIS
  static const apiProducts = "/products";

  /// headers

  static const Map<String,String> header = {
    "Content-Type": "application/json",
  };

  static Future<String?> methodGet({
    required String api,
    int? id, Map<String,
        String> headers = header
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url, headers: headers);
      if(response.statusCode == 200) {
        return response.body;
      }
    } catch(e) {
      return null;
    }
  }

  static List<HubProducts> parseProductList(String data){
    final jsone = jsonDecode(data) as List;
    return jsone.map((item) => HubProducts.fromJson(item)).toList();
  }
}

/// ustoz yozgan network
sealed class NetworkTeach{
  static const String baseUrl = "dummyapi.online";

  static String baseUrlUser = "642ce05cbf8cbecdb4f8cec2.mockapi.io";

  static String apiUser = "/api/v2/users";
  static const apiMovies = "/api/movies";
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static Future<String?> methodGet({required String api,String baseUrl = baseUrl,Object? id, Map<String, String> headers = headers}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url, headers: headers);
      if(response.statusCode == 200) {
        return response.body;
      }
    } catch(e) {
      return null;
    }
  }

  static List<Movie> parseMovieList(String data) {
    final json = jsonDecode(data) as List; /// String => json(Map, List, ...)
    return json.map((item) => Movie.fromJson(item)).toList(); /// json => object
  }
  static Movie parseMovie(String data) {
    final json = jsonDecode(data);
    final movie = Movie.fromJson(json);
    return movie;
  }

  static List<User> parseUserModelList(String data) {
    final json = jsonDecode(data) as List;
    return json.map((item) => User.fromJson(item)).toList();
  }
}
