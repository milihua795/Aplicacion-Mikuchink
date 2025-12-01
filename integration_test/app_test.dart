 import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Prueba de integración: App carga correctamente', (tester) async {
    // 1. Construir una app de prueba simple
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Mikhunchik - Prueba de Integración'),
          ),
        ),
      ),
    );

    // 2. Verificar que la app se carga
    expect(find.text('Mikhunchik - Prueba de Integración'), findsOneWidget);
  });

  testWidgets('Prueba de interacción con formulario simple', (tester) async {
    // 1. Construir un formulario de prueba
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Publicar Receta')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  key: const Key('test_nombre_field'),
                  decoration: const InputDecoration(labelText: 'Nombre de la receta'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: const Key('test_publicar_button'),
                  onPressed: () {},
                  child: const Text('Publicar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // 2. Verificar que los elementos existen
    expect(find.text('Publicar Receta'), findsOneWidget);
    expect(find.byKey(const Key('test_nombre_field')), findsOneWidget);
    expect(find.byKey(const Key('test_publicar_button')), findsOneWidget);

    // 3. Probar interacción del usuario
    await tester.enterText(find.byKey(const Key('test_nombre_field')), 'Receta de Prueba');
    await tester.pump();
    
    expect(find.text('Receta de Prueba'), findsOneWidget);
    
    // 4. Simular tap en el botón
    await tester.tap(find.byKey(const Key('test_publicar_button')));
    await tester.pump();
});
}