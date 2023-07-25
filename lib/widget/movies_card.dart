import 'package:flutter/material.dart';
import 'package:jsoncard/model/movie_data_model.dart';
import 'package:jsoncard/widget/field_text.dart';

class MovieCard extends StatelessWidget {
  final MovieDataModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 85,
              height: 110,
              child: Image(
                image: NetworkImage(movie.imageUrl.toString()),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Título en negrita para cada campo
                    FieldText(
                        title: "Categoría: ",
                        value: movie.category.toString(),
                        fontSize: 16),
                    FieldText(
                        title: "Popularidad: ",
                        value: movie.popularity.toString(),
                        fontSize: 16),
                    FieldText(
                        title: "Fecha de lanzamiento: ",
                        value: movie.date.toString(),
                        fontSize: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
