import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_browser/features/domain/provider.dart';
import 'package:movie_browser/features/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<StateManager>();
    return FutureBuilder(
      future: state.checkInternetConnection(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.cyan,
            child: Column(
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset(fit: BoxFit.cover, 'assets/icon.png'),
                  ),
                ),
                const Spacer(),
                const CircularProgressIndicator(),
                const SizedBox(height: 30),
              ],
            ),
          );
        }
        if (asyncSnapshot.hasData) {
          if (asyncSnapshot.data == true) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => GoRouter.of(context).go('/home'),
            );
          } else {
            return const AlertDialog(title: Text(noInternetConnect));
          }
        }
        if (asyncSnapshot.hasError) {
          return const AlertDialog(title: Text(connectionError));
        }
        return const SizedBox();
      },
    );
  }
}
