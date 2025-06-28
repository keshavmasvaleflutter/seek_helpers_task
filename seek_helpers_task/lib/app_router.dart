import 'package:go_router/go_router.dart';
import 'package:seek_helpers_task/features/features.dart';
import 'package:seek_helpers_task/view/splash_page.dart';
import 'core/core.dart';

class AppRouter {
  static final _routerObserver = MyGoRouterObserver();
  static final appRouter = GoRouter(
    initialLocation: '/${Routes.splash}',
    restorationScopeId: 'router',
    // debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/${Routes.splash}',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/${Routes.home}',
        name: Routes.home,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: '/${Routes.createUser}',
        name: Routes.createUser,
        builder: (context, state) => const CreateUser(),
      ),
      GoRoute(
        path: '/${Routes.userDetails}',
        name: Routes.userDetails,
        builder: (context, state) => UserDetails(user: state.extra as User),
      ),
    ],
    errorBuilder: (context, state) => const SplashPage(),
    observers: [
      _routerObserver,
    ],
  );
}
