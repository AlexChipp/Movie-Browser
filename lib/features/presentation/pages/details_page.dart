import 'package:flutter/material.dart';
import 'package:movie_browser/features/domain/provider.dart';
import 'package:movie_browser/features/domain/entity/movie_card.dart';
import 'package:movie_browser/features/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, this.card});
  final MovieCard? card;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<StateManager>();
    final String text = state.favorite.contains(card!)
        ? 'In the Favorite'
        : 'Add to Favorite';
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            spacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 400,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(fit: BoxFit.cover, card!.posterUrl),
                  ),
                ),
              ),
              Text(
                card!.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 22),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      releaseYear,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      card!.releaseYear,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  'Overview: ${card!.overview}',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(cyanColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(cyanColor),
                ),
                onPressed: () {
                  state.addToFavorite(card!);
                },
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
