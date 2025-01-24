import 'package:flutter/material.dart';
import 'package:flutter_go_router_app/main.dart';
import 'package:go_router/go_router.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: "/",
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Página no encontrada')),
      );
    },
    routes: [
      // Si se quiere usar una barra de navegacion que se quede fija a la hora de navegar usar esto
      // ShellRoute(
      //   routes: [routes],
      //   builder: (context, state, child) {
      //     return BottomNavigationBar(items: items);
      //   },
      // ),

      // Ruta principal
      GoRoute(
        path: "/",
        builder: (context, state) => HomeScreen(),
      ),

      // Ruta con parámetros
      GoRoute(
        path: "/details/:id",
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailsScreen(id: id);
        },
      ),

      // Rutas anidadas (por ejemplo, una ruta de perfil)
      GoRoute(
        path: "/settings",
        builder: (context, state) => SettingsScreen(),
        routes: [
          // Ruta anidada y Ruta protegida (requiere autenticación)
          GoRoute(
            path: "/profile",
            builder: (context, state) {
              final isAuthenticated = false; // Simula que no estamos logueados
              if (!isAuthenticated) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Error de Autenticación')),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: const Text('Ir a Login'),
                    ),
                  ),
                );
              }
              return ProfileScreen();
            },
          ),
        ],
      ),

      // Ruta de login
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
}
