import 'package:flutter/material.dart';
import 'package:movie_browser/features/domain/provider.dart';
import 'package:movie_browser/features/presentation/components/card_widget.dart';
import 'package:movie_browser/features/presentation/pages/details_page.dart';
import 'package:movie_browser/features/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<StateManager>();
    if (state.favorite.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150, child: Image.asset('assets/empty.png')),
            const Text(
              empty,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      );
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
      ),
      itemCount: state.favorite.length,
      itemBuilder: (context, index) {
        final movie = state.favorite[index];
        final icon = state.favorite.contains(movie)
            ? Icons.star
            : Icons.star_border;
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsPage(card: movie)),
          ),
          child: CardWidget(movie: movie, state: state, icon: icon),
        );
      },
    );
  }
}
