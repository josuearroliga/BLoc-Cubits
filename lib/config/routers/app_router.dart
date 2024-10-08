import 'package:formsapp/presentation/barrel.dart';
import 'package:formsapp/presentation/screens/bloc_counter_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterScreen(),
  ),
  GoRoute(
    path: '/bloc',
    builder: (context, state) => const BlocCounterScreen(),
  ),
  GoRoute(
    path: '/register-page',
    builder: (context, state) => const RegisterScreen(),
  ),
]);
