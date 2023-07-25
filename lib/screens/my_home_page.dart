import 'package:flutter/material.dart';
import 'package:jsoncard/model/movie_data_model.dart';
import 'package:jsoncard/providers/movie_data_provider.dart';
import 'package:jsoncard/widget/movies_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lectura de archivo JSON'),
      ),
      body: FutureBuilder<List<MovieDataModel>>(
        future: MovieDataProvider.getMoviesData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<MovieDataModel> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: items[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
