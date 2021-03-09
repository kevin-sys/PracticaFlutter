import 'package:flutter/material.dart';

void main() => runApp(TextoEjercicio());

class TextoEjercicio extends StatefulWidget {
  @override
  _TextoEjercicioState createState() => _TextoEjercicioState();
}

class _TextoEjercicioState extends State<TextoEjercicio> {
  TextEditingController controladornombre;
  TextEditingController controladorapellido;
  TextEditingController controladoredad;

  @override
  void initState() {
    controladornombre = TextEditingController();
    controladorapellido = TextEditingController();
    controladoredad = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Diseño CRUD'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  controller: controladornombre,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Nombres',
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controladornombre.clear();
                        },
                      )
                      //probar suffix
                      ),
                  onSubmitted: (String nombres) {
                    cajatexto(context, nombres);
                  }),
            ),

            //Apellidos
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  controller: controladorapellido,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Apellidos',
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controladorapellido.clear();
                        },
                      )
                      //probar suffix
                      ),
                  onSubmitted: (String nombres) {
                    cajatexto(context, nombres);
                  }),
            ),
//Edad
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  controller: controladoredad,
                  keyboardType:
                      TextInputType.number, // Probar todos los teclados
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Edad',
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controladoredad.clear();
                        },
                      )
                      //probar suffix
                      ),
                  onSubmitted: (String nombres) {
                    cajatexto(context, nombres);
                  }),
            ),
            // Boton
            ElevatedButton(
              onPressed: () {
                if (controladornombre.text.isNotEmpty &&
                    controladorapellido.text.isNotEmpty) {
                  cajatexto(
                      context,
                      controladornombre.text +
                          controladorapellido.text +
                          controladoredad.text);

                  controladornombre.clear();
                  controladorapellido.clear();
                  controladoredad.clear();
                }
              },
              child: Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> cajatexto(BuildContext context, String nombres) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Alerta'),
              content: Text('Mi Nombre es $nombres'),
            ));
  }
}
