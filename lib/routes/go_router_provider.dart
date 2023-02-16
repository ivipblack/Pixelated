import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/home_base.dart';
import 'package:pixelated/screens/home.dart';

final GlobalKey<NavigatorState> _rootNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) =>
              HomeBase(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const Home(),
            ),
            GoRoute(
              path: '/1',
              builder: (context, state) => Container(),
            ),
            GoRoute(
              path: '/2',
              builder: (context, state) => Container(),
            ),
            GoRoute(
              path: '/3',
              builder: (context, state) => Container(),
            ),
            GoRoute(
              path: '/4',
              builder: (context, state) => Container(),
            ),
          ],
          navigatorKey: _shellNavigator,
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const Home(),
        ),
      ],
      initialLocation: '/home',
      navigatorKey: _rootNavigator,
    );
  },
);
