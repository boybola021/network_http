import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:network_http/models/hub_product_model.dart';
import 'package:network_http/views/card.dart';
import '../models/movies_model.dart';
import '../models/product_models.dart';
import '../models/quolts.dart';
import '../servise/network_servise.dart';

void main() => runApp(const LearnHttp());

class LearnHttp extends StatelessWidget {
  const LearnHttp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }
}

/// 3

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> items = [];

  void fetchMovie()async{
    final data = await NetworkTeach.methodGet(api: NetworkTeach.apiMovies);
    items = NetworkTeach.parseMovieList(data!);
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    fetchMovie();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return MovieCard(
              movie: items[index],
          );
        },
      ),
    );

  }
}

/// 1
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movies> items = [];

  void fetchMovies() async {
    final data = await Network.methodGet(api: NetworkMovie.apiMovies);
    items = NetworkMovie.parseMoviesList(data!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final movie = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
            child: ListTile(
              leading: Text(movie.id.toString(), style: Theme.of(context).textTheme.headlineSmall,),
              title: Text(movie.movie, style:  Theme.of(context).textTheme.titleLarge,),
              subtitle: Text(movie.imdbUrl, style: Theme.of(context).textTheme.labelMedium),
              trailing: Text(movie.rating.toString(), style: Theme.of(context).textTheme.bodyMedium),
            ),
          );
        },
      ),
    );
  }
}

*/
/// home task

/// hub products

/*
class HubProductsPage extends StatefulWidget {
  const HubProductsPage({Key? key}) : super(key: key);

  @override
  State<HubProductsPage> createState() => _HubProductsPageState();
}

class _HubProductsPageState extends State<HubProductsPage> {
  List<HubProducts> list = [];
  bool isLoding = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
    String? data = await NetworkHub.methodGet(api: NetworkHub.apiProducts);
    if(data != null){
      list = NetworkHub.parseProductList(data);
      log(" ===============> $list <==========");
      isLoding = true;
      setState(() {});
    }else{
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hub product"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
          }, icon:  const Icon(Icons.arrow_circle_right_outlined,),)
        ],
      ),
      body: isLoding ? ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final products = list[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(products.id.toString(), style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
              title: Text(products.name,style: Theme.of(context).textTheme.headlineSmall),
              subtitle: Text(products.discription,style: Theme.of(context).textTheme.labelMedium,),
              trailing: Text(products.price,style: Theme.of(context).textTheme.bodyMedium,),
            ),
          );
        },
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}


/// movice


class MoviecPage extends StatefulWidget {
  const MoviecPage({Key? key}) : super(key: key);

  @override
  State<MoviecPage> createState() => _MoviecPageState();
}

class _MoviecPageState extends State<MoviecPage> {
  List<Movies> list = [];
  bool isLoding = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
    String? data = await NetworkMovie.methodGet(api: NetworkMovie.apiMovies);
    if(data != null){
      list = NetworkMovie.parseMoviesList(data);
       log(" ===============> $list <==========");
      isLoding = true;
      setState(() {});
    }else{
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("movies"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HubProductsPage()));
          }, icon:  const Icon(Icons.arrow_circle_right_outlined,),)
        ],
      ),
      body: isLoding ? ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final movice = list[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(movice.id.toString(), style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
              title: Text(movice.movie,style: Theme.of(context).textTheme.headlineSmall),
              subtitle: Text(movice.imdbUrl,style: Theme.of(context).textTheme.labelMedium,),
              trailing: Text(movice.rating.toString(),style: Theme.of(context).textTheme.bodyMedium,),
            ),
          );
        },
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}

/// products

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> list = [];
  bool isLoding = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
    String? data = await Network.methodGet(api: Network.apiProducts);
    if(data != null){
      list = Network.parseProductList(data);
       log(" ===============> $list <==========");
      setState(() {});
    }else{
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        actions: [
         IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviecPage()));
         }, icon:  const Icon(Icons.arrow_circle_right_outlined,),)
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final product = list[index];
          return Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(product.id.toString(), style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
              title: Text(product.title),
              subtitle: Text(product.description),
            ),
          );
        },
      ) ,//: const Center(child: CircularProgressIndicator()),
    );
  }
}



/// quote

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  List<Quote> list = [];
 bool isLoding = false;
 final domain = "dummyjson.com";
 final api = "/quotes";

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
    String? data = await Network.methodGet(api: Network.apiQuotes);
    if(data != null){
      list = Network.parseQuoteList(data);
     // log(" ===============> $list <==========");
      isLoding = true;
      setState(() {});
    }else{
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage()));
          }, icon:  Icon(Icons.arrow_circle_right_outlined,),)
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final quote = list[index];
          return Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(quote.id.toString(), style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
              title: Text(quote.author),
              subtitle: Text(quote.quote),
            ),
          );
        },
      ), //: const Center(child: Text("No Data",style: TextStyle(fontSize: 26),),)//: const Center(child: CircularProgressIndicator()),
    );
  }
}

*/

///  Takrorlash

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> list = [];


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    String? data = await Network.methodGet(api: Network.apiPosts);
    if(data != null) {
      list = Network.parsePostList(data);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error! Check your network connection")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User posts"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final post = list[index];
          return Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(post.userId.toString(), style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
              title: Text(post.title),
              subtitle: Text(post.body),
            ),
          );
        },
      ),
    );
  }
}


class Network {
  /// DOMAIN
  static const baseUrl = "jsonplaceholder.typicode.com";

  /// APIS
  static const apiPosts = "/posts";
  static const apiTodos = "/todos";
  static const apiUsers = "/users";
  static const apiAlbums = "/albums";
  static const apiComments = "/comments";
  static const apiPhotos = "/photos";

  /// METHODS
  static Future<String?> methodGet({required String api, int? id}) async {
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
  static List<Todo> parsePostList(String data) {
    final List result = jsonDecode(data);
    final items = result.map((json) => Todo.fromJson(json)).toList();
    return items;
  }
}
 */
///  ///  ////
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Album> list = [];

  final domain = "jsonplaceholder.typicode.com";
  final apiAlbums = "/albums";
  final apiPosts = "/posts";

  @override
  void initState() {
    super.initState();
    fetchAlbums();
  }

  void fetchAlbums() async {
    String data = await getMethod(api: apiAlbums);
    list = parseAlbumList(data);
    setState(() {});
  }

  Future<String> getMethod(
      {required String api,
        String baseUrl = "jsonplaceholder.typicode.com",
        int? id}) async {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
    final response = await get(url);

    if (response.statusCode == 200) {
      return response.body;
    }

    throw Exception("Network Exception");
  }

  List<Album> parseAlbumList(String data) {
    final List result = jsonDecode(data);
    final items = result.map((json) => Album.fromJson(json)).toList();
    return items;
  }
  //
  // List<Post> parsePostList(String data) {
  //   final List result = jsonDecode(data);
  //   final items = result.map((json) => Post.fromJson(json)).toList();
  //   return items;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User posts"),
      ),
      body: list.isNotEmpty
          ? ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final album = list[index];

          return Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                  Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(
                  album.userId.toString(),
                  style:
                  const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              title: Text(album.title),
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
 */
/// 10

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Albums> list = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData() async{
    String? data = await Network.getMedhod(api: Network.apiPhotos);
    if(data != null){
      list = Network.parsePhotoList(data);
      setState(() {});
    }
    throw Exception("Error");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Post"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            final photo = list[index];
            return Card(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                   image: DecorationImage(
                     image: NetworkImage(photo.url),
                   )
                  ),
                  child: Text(photo.userId.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                ),
                title: Text(photo.title),
                subtitle: Text(photo.albumId.toString()),
              ),
            );
          }
      ),
    );
  }
}

*/
/*
class Network{
  /// domain
  static const baseUrl = "jsonplaceholder.typicode.com";

  /// APIS

  static const apiPost = "/posts";
  static const apiTodos = "/todos";
  static const apiUsers = "/users";
  static const apiAlbums = "/albums";
  static const apiComments= "/comments";
  static const apiPhotos = "/photos";

  static Future<String?>getMedhod({
    required String api,
    int? id,
  }) async{
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    try{
      final response = await get(url);
      if(response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return response.body;
      }
    }catch(e){
      return e.toString();
    }
  }
  static List<Todo>parsePostList(String data){
    final List result = jsonDecode(data);
    final item = result.map((json) => Todo.fromJson(json)).toList();
    return item;
  }
  static List<Album>parsePhotoList(String data){
    final List result = jsonDecode(data);
    final item = result.map((json) => Album.fromJson(json)).toList();
    return item;
  }
}
*/

class Album{
  int albumId;
  int userId;
  String title;
  String url;
  int id;
  String thumbnairUrl;

  Album({

    required this.id,
    required this.userId,
    required this.title,
    required this.url,
    required this.albumId,
    required this.thumbnairUrl,
  });

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      url:          json["url"],
      albumId:      json["albumId"],
      thumbnairUrl: json["thumbnairUrl"],
    );
  }
}


/// snepshot 9


/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> list = [];
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData() async{
    String? data = await Network.getMedhod(api: Network.apiPost);
    if(data != null){
      list = Network.parsePostList(data);
      setState(() {});
    }
    throw Exception("Error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Post"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            final post = list[index];
            return Card(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.primaries[index % Colors.primaries.length]
                  ),
                  child: Text(post.userId.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                ),
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          }
      ),
    );
  }
}

 
class Network{
  /// domain
  static const baseUrl = "jsonplaceholder.typicode.com";

  /// APIS

 static const apiPost = "/posts";
 static const apiTodos = "/todos";
 static const apiUsers = "/users";
 static const apiAlbums = "/albums";
 static const apiComments= "/comments";
 static const apiPhotos = "/photos";

 static Future<String?>getMedhod({
   required String api,
   int? id,
 }) async{
   Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
   try{
     final response = await get(url);
     if(response.statusCode == 200) {
       final List result = jsonDecode(response.body);
       return response.body;
     }
   }catch(e){
     return e.toString();
   }
   }
   static List<Todo>parsePostList(String data){
     final List result = jsonDecode(data);
     final item = result.map((json) => Todo.fromJson(json)).toList();
     return item;
   }
}
*/

/// snepshot 8

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> list = [];
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData() async{
    String data = await getMedhod(api: api);
    list = parsePostList(data);
  }
  Future<String>getMedhod({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }) async{
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    final response = await get(url);
    if(response.statusCode == 200) {
      final List result = jsonDecode(response.body);
        return response.body;
      }
    throw Exception("Eror");
  }
  List<Todo>parsePostList(String data){
    final List result = jsonDecode(data);
    final item = result.map((json) => Todo.fromJson(json)).toList();
    return item;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Post"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            final post = list[index];
            return Card(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.primaries[index % Colors.primaries.length]
                  ),
                  child: Text(post.userId.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                ),
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          }
      ),
    );
  }
}
 */
/// snepshot 7

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> list = [];
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }
  void getDataFromCloud ({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }) async{
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    final response = await get(url);
    if(response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      list = result.map((json) => Todo.fromJson(json)).toList();
      log("data : $list");
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Post"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            final post = list[index];
            return Card(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.primaries[index % Colors.primaries.length]
                  ),
                  child: Text(post.userId.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                ),
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          }
      ),
    );
  }
}
 */

/// snepshot 6
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> list = [];
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }){
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    get(url).then((response){
      if(response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        list = result.map((json) => Todo.fromJson(json)).toList();
        log("data : $list");
      }
      setState(() {});
        });
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Post"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            final post = list[index];
            return Card(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.primaries[index % Colors.primaries.length]
                  ),
                  child: Text(post.userId.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                ),
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          }
      ),
    );
  }
}
*/
/// snepshot 5
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> list = [];
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }){
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    get(url).then((response){
      if(response.statusCode == 200){
        final  List result = jsonDecode(response.body);
         result.forEach((element) {
           final post = Todo.fromJson(element);
           list.add(post);
         });
      }
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Post"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            final post = list[index];
            return Card(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.primaries[index % Colors.primaries.length]
                  ),
                  child: Text(post.userId.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                ),
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          }
      ),
    );
  }
}
 */
/// snepshot 4

/*
 class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

   @override
   State<HomePage> createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
  List<Todos> list = [];
  final domain = "dummyjson.com";
  final api = "/todos";
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "dummyjson.com",
    int? id,
 }){
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    get(url).then((response){
      if(response.statusCode == 200){
        final  result = jsonDecode(response.body);
        for(int i = 0; i < result["todos"].length;i++){
          final todo = Todos.fromJson(result["todos"][i]);
          list.add(todo);
        }
      }
      setState(() {});
    });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("User Todos"),),
       body: ListView.builder(
         itemCount: list.length,
           itemBuilder: (_,index){
             final todo = list[index];
             return Card(
               child: ListTile(
                 leading: Container(
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.primaries[index % Colors.primaries.length]
                   ),
                   child: Text("$index",style: const TextStyle(color: Colors.white,fontSize: 16),),
                 ),
                 title: Text(todo.todo),
                 subtitle: Text(todo.complated.toString()),
               ),
             );
           }
       ),
     );
   }
 }

 class Todos{
  String todo;
  bool complated;
  Todos({required this.todo,required this.complated});

  factory Todos.fromJson(Map<String,dynamic> json){
    return Todos(
     todo:  json["todo"],
     complated: json["completed"],
    );
  }
 }
 */
/// snepshot 3

/*
 class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

   @override
   State<HomePage> createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
  List<Todo> list = [];
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
 }){
    Uri url = Uri.https(baseUrl,"$api,${id != null ? "/$id" : "" }");
    get(url).then((response){
      if(response.statusCode == 200){
        final List result = jsonDecode(response.body);
        for(int i = 0; i < result.length;i++){
          final post = Todo.fromJson(result[i]);
          list.add(post);
        }
      }
      setState(() {});
    });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("User Post"),),
       body: ListView.builder(
         itemCount: list.length,
           itemBuilder: (_,index){
             final post = list[index];
             return Card(
               child: ListTile(
                 leading: Container(
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.primaries[index % Colors.primaries.length]
                   ),
                   child: Text(post.userId.toString(),style: TextStyle(color: Colors.white,fontSize: 16),),
                 ),
                 title: Text(post.title),
                 subtitle: Text(post.body),
               ),
             );
           }
       ),
     );
   }
 }

*/
/// snepshot 2

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product? product;
  final domain = "fakestoreapi.com";
  final api = "/products";
  bool isLoding = false;
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,id: 1);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "fakestoreapi.com",
    int? id
  }){
    Uri url = Uri.https(baseUrl,"$api ${id != null? "/$id" : ""}");
    get(url).then((response){
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        product = Product.fromJson(result);
        isLoding = true;
      }
      setState(() {});
      log(product!.title);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding ? Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.network(product!.image),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10,),
                Text(product!.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product!.price.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                    const Text("Price",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    const SizedBox(height: 150,),
                    Text(product!.rating.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                  ],
                ),
                Text(product!.description),
              ],
            ),
          ),
        ],
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}

*/
/// snepshot 1
/*

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 Product? product;
 final domain = "fakestoreapi.com";
 final api = "/products";
 bool isLoding = false;
 @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,id: 1);
  }
  void getDataFromCloud({
   required String api,
   String baseUrl = "fakestoreapi.com",
   int? id
}){
   Uri url = Uri.https(baseUrl,"$api ${id != null? "/$id" : ""}");
   get(url).then((response){
     if(response.statusCode == 200){
       final result = jsonDecode(response.body);
       product = Product.fromJson(result);
       isLoding = true;
     }
     setState(() {});
     log(product!.title);
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding ? Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.network(product!.image),
          ),
           Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10,),
                Text(product!.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product!.price.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                    const Text("Price",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                   const SizedBox(height: 150,),
                    Text(product!.rating.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                  ],
                ),
                Text(product!.description),
              ],
            ),
          ),
        ],
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}

*/
/*
class Product{
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating
});

   factory Product.fromJson(Map<String,dynamic>json){
     return Product(
         id:         json["id"] ,
         price:      json["price"] ,
         title:       json["title"] ,
         description: json["description"] ,
         category   :  json["category"] ,
         image:     json["image"],
         rating: Rating.fromJson(json["rating"]),
     );
   }

}

  class Rating{
  double rate;
  int count;
  Rating({required this.rate,required this.count});
  factory Rating.fromJson(Map<String, dynamic>json){
    return Rating(rate: json["rate"], count: json["count"],);
  }
  }
*/


/*

/// kamchiligi bor
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Albums> albums = [];

  final domain = "jsonplaceholder.typicode.com";
  final api = "/albums";


  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }

  void fetchAlbum()async{
    String data = await getMethod(api: api);
  }

  Future<String> getMethod({
    required String api,
    required String baseUrl = "jsonplaceholder.typicode.com",
    int? id,

})async {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
    final  respons = await get(url);
    if(respons.statusCode == 200){
      return respons.body;
    }
    throw Exception("Errpr");
  }
  //List<Albums> parse

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (_,index){
              final post = albums[index];
              return Card(
                child:  ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(
                    post.title,
                    style: const TextStyle(fontSize: 26),
                  ),
                  subtitle: Text(post.userId.toString()),
                ),
              );
            }
        ), //: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
 ///kamchili bor
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Albums> albums = [];

  final domain = "jsonplaceholder.typicode.com";
  final api = "/albums";


  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api);
  }

  void getDataFromCloud({
    required String api,
    // String baseUrl = "jsonplaceholder.typicode.com",
    String baseUrl = "dummyjson.com",
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
    get(url).then((response) {
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        for(int i = 0; i < result.length;i++){
          final albums = result.map((json) => Albums.fromJson(json)).toList();

          //.add(post);
          log(result[i]);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (_,index){
              final post = albums[index];
              return Card(
                child:  ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(
                    post.title,
                    style: const TextStyle(fontSize: 26),
                  ),
                  subtitle: Text(post.userId.toString()),
                ),
              );
            }
        ), //: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
*/

class Albums{
  int id;
  int userId;
  String title;

  Albums({
    required this.id,
    required this.userId,
    required this.title
});

  factory Albums.fromJson(Map<String,dynamic> json){
    return Albums(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
    );
  }
}

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Todo> todo = [];
  String text = "No Data";
  final domain = "jsonplaceholder.typicode.com";

  //final api = "/posts";
  final api = "/todos";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,);
  }

  void getDataFromCloud({
    required String api,
   // String baseUrl = "jsonplaceholder.typicode.com",
      String baseUrl = "dummyjson.com",
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");

    get(url).then((response) {
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        for(int i = 0; i < result.length;i++){
          final post = Todo.fromJson(result[i]);
          todo.add(post);
          log(result[i]);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (_,index){
              final post = todo[index];
              return Card(
                child:  ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
              );
            }
        ), //: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
 */


/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Todo> todo = [];
  String text = "No Data";
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,);
  }

  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
  //  String baseUrl = "https://dummyjson.com/todos"
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");

    get(url).then((response) {
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        for(int i = 0; i< result.length;i++){
          final post = Todo.fromJson(result[i]);
          todo.add(post);
          log(result[i]);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: todo.length,
            itemBuilder: (_,index){
              final post = todo[index];
              return Card(
                child:  ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                    child: Text(post.userId.toString(),style: TextStyle(color: Colors.white,fontSize: 16),),
                  ),
                  title: Text(
                    post.title,
                    style: const TextStyle(fontSize: 26),
                  ),
                  subtitle: Text(post.body),
                ),
              );
            }
        ), //: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}

*/

/// home Task


/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product? product;
  String text = "No Data";
  final domain = "fakestoreapi.com/products/1";
  final api = "/products";
  final id = "1";
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api, id: 1);
  }

  void getDataFromCloud({
    required String api,
    String baseUrl = "fakestoreapi.com",
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");

    get(url).then((response) {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        product = Product.fromJson(result);
      }
      setState(() {});
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading ?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(
                child: Image.network(product!.image),
            ),
            Text("title: ${product!.title}",style: const TextStyle(fontSize: 20),),
            Text("decripton: ${product!.decription}", style:const  TextStyle(fontSize: 20),),
            Text("price: ${product!.price}",style: const TextStyle(fontSize: 20),),

          ],
      ),
        ) : const Center(child: CircularProgressIndicator()),
    );
  }
}

*/




/// snepshot 7

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Todo? todo;
  String text = "No Data";
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api, id: 1);
  }

  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");

    get(url).then((response) {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        todo = Todo.fromJson(result);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: todo != null ? ListTile(
          title: Text(
            todo!.title,
            style: const TextStyle(fontSize: 26),
          ),
          subtitle: Text(todo!.body),
        ) : Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
*/


/// snepshot 6
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Todo? todo;
  String text = "No Data";
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api, id: 1);
  }

  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");

    get(url).then((response) {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        todo = Todo(
            id: result["id"],
            userId: result["userId"],
            title: result["title"],
            body: result["body"]);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: todo != null ? ListTile(
          title: Text(
            todo!.title,
            style: const TextStyle(fontSize: 26),
          ),
          subtitle: Text(todo!.body),
        ) : Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
*/

/// snepshot 5

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "No Data";
  final domain = "jsonplaceholder.typicode.com";
  final api = "/posts";
  final id = "1";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api, id: 1);
  }

  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }) {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");

    get(url).then((response) {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        text = result['title'];
      } else {
        text = "Something error!";
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
 */
/// snepshot 4
/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "No Data";
  final domain = "https://jsonplaceholder.typicode.com";
  final api = "/posts";
  final id = "/1";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,id: 1);
  }
  void getDataFromCloud({
    required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
  }){
    Uri url = Uri.https(baseUrl,"$api${id != null? "/$id" : ""}");
    get(url).then((respons){
      if(respons.statusCode == 200){
        text = respons.body;
      }else{
        text = "Something error!";
      }
      final result = jsonDecode(text);
      log((result is Map).toString());
      log(result.toString());
      log("title: ${result["title"]}");
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
*/

/// snepshot 3

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "No Data";
  final domain = "https://jsonplaceholder.typicode.com";
  final api = "/posts";
  final id = "/1";

  @override
  void initState() {
    super.initState();
    getDataFromCloud(api: api,id: 1);
  }
  void getDataFromCloud({
   required String api,
    String baseUrl = "jsonplaceholder.typicode.com",
    int? id,
}){
    Uri url = Uri.https(baseUrl,"$api${id != null? "/$id" : ""}");
    get(url).then((respons){
      if(respons.statusCode == 200){
        text = respons.body;
      }else{
        text = "Something error!";
      }
       setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
 */

/// snepshot 2

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "No Data";
  final path = "https://jsonplaceholder.typicode.com/post/1";
  @override
  void initState() {
    super.initState();
    getDataFromCloud();
  }
  void getDataFromCloud(){
    Uri url = Uri.parse(path);
    get(url).then((respons){
      if(respons.statusCode == 200){
        text = respons.body;
      }else{
        text = "Something error!";
      }
        setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
*/

/// snepshot 1


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "No Data";
  final path = "htts://jsoneplaceholdeer.typicode.com/posts";
  @override
  void initState() {
    super.initState();
    getDataFromCloud();
  }
  void getDataFromCloud(){
    Uri url = Uri.parse(path);
    get(url).then((respons){
      log("body : ${respons.body}\n");
       log("statusCode : ${respons.statusCode}\n");
       log("bodyBytes : ${respons.bodyBytes}\n");
       log("headers : ${respons.headers}\n");
       log("request : ${respons.request}\n");
       log("reasonPhrase : ${respons.reasonPhrase}\n");
       log("isRedirect : ${respons.isRedirect}\n");
       log(" persistentConnection: ${respons.persistentConnection}\n");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text,style: const TextStyle(fontSize: 26),),
      ),
    );
  }
}
*/
