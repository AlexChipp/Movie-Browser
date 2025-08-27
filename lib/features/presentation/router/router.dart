import 'package:go_router/go_router.dart';
import 'package:movie_browser/features/presentation/pages/details_page.dart';
import 'package:movie_browser/features/presentation/pages/splash_screen.dart';
import 'package:movie_browser/my_app.dart';

GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const MyApp()),
    GoRoute(path: '/details', builder: (context, state) => const DetailsPage()),
  ],
);
