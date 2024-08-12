import 'package:flutter/material.dart';
// pour debug
import 'package:flutter/foundation.dart';
// decode data
import 'dart:convert';
// http request
import 'package:http/http.dart' as http;


class PageList extends StatefulWidget {
  const PageList({super.key});

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      
      const apiUrl = 'https://jsonplaceholder.typicode.com/posts';

      final http.Response response = await http.get(Uri.parse(apiUrl));
      posts = json.decode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }

    return posts;
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datas depuis internet")),
      body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        // render the list
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          // render list item
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(snapshot.data![index]['title']),
                            subtitle: Text(snapshot.data![index]['body']),
                          ),
                        ),
                      )
                    : const Center(
                        // render the loading indicator
                        child: CircularProgressIndicator(),
                      )));
    
  }
}