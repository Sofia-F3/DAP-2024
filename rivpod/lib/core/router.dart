import 'package:go_router/go_router.dart';
import 'package:rivpod/screens/home_screen.dart';
import 'package:rivpod/screens/details_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: DetailScreen.routeName,
      builder: (context, state) {
        final String? name = state.extra as String?;
        return DetailScreen(name: name);
      },
    ),
  ],
);
