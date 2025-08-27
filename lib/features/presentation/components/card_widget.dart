import 'package:flutter/material.dart';
import 'package:movie_browser/features/domain/provider.dart';
import 'package:movie_browser/features/domain/entity/movie_card.dart';
import 'package:movie_browser/features/presentation/theme/theme.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.movie,
    required this.state,
    required this.icon,
  });

  final MovieCard movie;
  final StateManager state;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(movie.posterUrl, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: IconButton(
                    onPressed: () {
                      state.addToFavorite(movie);
                    },
                    icon: Icon(icon, color: Colors.amberAccent, size: 32),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Text(releaseYear, style: TextStyle(fontSize: 12)),
                      const Spacer(),
                      Text(
                        movie.releaseYear,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
