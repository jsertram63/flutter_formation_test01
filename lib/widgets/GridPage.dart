import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid affiche")),
      body: GridView.count(
  crossAxisCount: 2,
  children: List.generate(10, (index) {
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          'Item $index',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  },
),
      ));
  }
  
}