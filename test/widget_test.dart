import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// MOCK de PublicarScreen para evitar Firebase e imágenes
class PublicarScreenMock extends StatelessWidget {
  const PublicarScreenMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comparte tu receta")),
      body: const Column(
        children: [
          TextField(key: Key('nombre_del_plato_field')),
          TextField(key: Key('ingredientes_field')),
          TextField(key: Key('procedimiento_field')),
          TextField(key: Key('presupuesto_field')),
          SizedBox(height: 20),
          DropdownMenu<String>(
            initialSelection: '1 a 2',
            dropdownMenuEntries: [
              DropdownMenuEntry(value: '1 a 2', label: '1 a 2'),
              DropdownMenuEntry(value: '2 a 4', label: '2 a 4'),
            ],
          ),
          ElevatedButton(
            key: Key('publicar_button'),
            onPressed: null,
            child: Text('Publicar'),
          ),
        ],
      ),
    );
  }
}

void main() {
  testWidgets('PublicarScreenMock muestra todos los campos correctamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PublicarScreenMock(),
      ),
    );

    expect(find.byKey(const Key('nombre_del_plato_field')), findsOneWidget);
    expect(find.byKey(const Key('ingredientes_field')), findsOneWidget);
    expect(find.byKey(const Key('procedimiento_field')), findsOneWidget);
    expect(find.byKey(const Key('presupuesto_field')), findsOneWidget);
    expect(find.byKey(const Key('publicar_button')), findsOneWidget);

    expect(find.text('Comparte tu receta'), findsOneWidget);
    expect(find.text('Publicar'), findsOneWidget);
  });

  testWidgets('PublicarScreenMock - llenar formulario', 
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PublicarScreenMock(),
      ),
    );

    await tester.enterText(
      find.byKey(const Key('nombre_del_plato_field')),
      'Lomo Saltado Económico',
    );

    await tester.pump();

    expect(find.text('Lomo Saltado Económico'), findsOneWidget);
  });
}
