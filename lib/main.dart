import 'package:flutter/material.dart';
import 'package:flutter_go_router_app/routing/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router(),
    );
  }
}

// Pantalla Home
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar con un parámetro, Para navegar se usa context.go .push .pop etc
                context.go('/details/42');
              },
              child: const Text('Ir a detalles'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a settings, Para navegar se usa esto
                context.go('/settings');
              },
              child: const Text('Ir a configuraciones'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de detalles que recibe un parámetro
class DetailsScreen extends StatelessWidget {
  final String id;

  DetailsScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles')),
      body: Center(
        child: Text('Detalles de la ID: $id'),
      ),
    );
  }
}

// Pantalla de configuraciones
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuraciones')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar a la ruta anidada
            context.go('/settings/profile');
          },
          child: const Text('Ir al perfil'),
        ),
      ),
    );
  }
}

// Pantalla de perfil (ruta anidada)
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: const Center(child: Text('Bienvenido al perfil')),
    );
  }
}

// Pantalla de login (usada para rutas protegidas)
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Lógica de autenticación (solo ejemplo)
            context.go('/profile'); // Una vez "logueado", ir al perfil
          },
          child: const Text('Iniciar sesión'),
        ),
      ),
    );
  }
}
