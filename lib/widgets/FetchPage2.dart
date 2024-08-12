import 'package:flutter/material.dart';
import 'package:flutter_test_application/Datamanager/Boxes.dart';
import 'package:flutter_test_application/Datamanager/Post.dart';

// decode data
import 'dart:convert';
// http request
import 'package:http/http.dart' as http;
// pour debug
import 'package:flutter/foundation.dart';


class PageListe2 extends StatefulWidget {
  const PageListe2({super.key});

  @override
  State<PageListe2> createState() => _PageListe2State();
}

Future<List<Post>> _loadData() async {
    List<Post>? posts = [];


    if (boxPosts.isEmpty){  
      print("RECUPERATION DES POSTS");
       try {
          const apiUrl = 'https://jsonplaceholder.typicode.com/posts';
          final http.Response response = await http.get(Uri.parse(apiUrl));
          final List<dynamic> jsonData = json.decode(response.body);

         posts = jsonData.map((post) => Post.fromJson(post)).toList();
         
         for (var post in posts){
          boxPosts.add(post);
         }
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
     }
    }
    posts = boxPosts.values.cast<Post>().toList();
    return posts;
  }

class _PageListe2State extends State<PageListe2> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Datas depuis internet")),
      body: FutureBuilder(
        future: _loadData(),
        builder: (BuildContext ctx, AsyncSnapshot<List<Post>> snapshot) =>
            snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      final post = snapshot.data![index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(post.title),
                          subtitle: Text(post.body),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}