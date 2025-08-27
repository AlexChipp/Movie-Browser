import 'package:flutter/material.dart';
import 'package:movie_browser/features/domain/provider.dart';
import 'package:movie_browser/features/domain/entity/movie_card.dart';
import 'package:movie_browser/features/presentation/components/card_widget.dart';
import 'package:movie_browser/features/presentation/pages/details_page.dart';
import 'package:movie_browser/features/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  const MoviePage();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<StateManager>();
    if (state.listCard.isEmpty) {
      state.loadMap('assets/movie.json');
    }
    if (state.listCard.isEmpty) {}
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Column(
        children: [
          Expanded(child: GridWidget(movies: state.listCard)),

          const Divider(color: Colors.black, height: 0.5),
        ],
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.movies});

  final List<MovieCard> movies;

  @override
  Widget build(BuildContext context) {
    final favoriteList = context.select<StateManager, List>((e) => e.favorite);

    final state = context.watch<StateManager>();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
      ),
      itemCount: movies.length + 1,
      itemBuilder: (context, index) {
        if (index < movies.length) {
          final movie = movies[index];
          final icon = favoriteList.contains(movie)
              ? Icons.star
              : Icons.star_border;
          return Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(card: movie),
                ),
              ),
              child: CardWidget(movie: movie, state: state, icon: icon),
            ),
          );
        } else {
          return IconAddWidget(state: state);
        }
      },
    );
  }
}

class IconAddWidget extends StatelessWidget {
  const IconAddWidget({super.key, required this.state});

  final StateManager state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(30, 255, 255, 255),
          ),
          child: IconButton(
            onPressed: () {
              if (state.listCard.length < 12) {
                state.loadMap('assets/second_movie.json');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.cyan,
                    content: Text(movieOver, textAlign: TextAlign.center),
                  ),
                );
              }
            },
            icon: const Icon(Icons.add, size: 50),
          ),
        ),
      ),
    );
  }
}
