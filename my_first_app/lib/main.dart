import 'package:flutter/material.dart';

void main() {
  runApp(IMCApp());
}

class IMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IMCScreen(),
    );
  }
}

class IMCScreen extends StatefulWidget {
  @override
  _IMCScreenState createState() => _IMCScreenState();
}


class _IMCScreenState extends State<IMCScreen> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  double _imc= 0.0;
  String _mensaje = '';
  String _mensaje2 = '';

void _calcularIMC() {
  double? peso = double.tryParse(_pesoController.text);
  double? altura = double.tryParse(_alturaController.text);
  
  if (peso != null && altura != null && altura > 0) {
    double imc = peso / (altura / 100 * altura / 100);
    setState(() {
      _imc = imc;
      if (imc < 18.5) {
        _mensaje = 'Bajo peso';
      _mensaje2 = '''\nAlimentación balanceada: Consume una dieta equilibrada que incluya una variedad de alimentos nutritivos, como frutas, verduras, proteínas magras, granos enteros y grasas saludables. Aumenta tu ingesta de calorías eligiendo alimentos densos en nutrientes y evitando los alimentos procesados y con alto contenido de azúcares y grasas saturadas.
      \nIncrementa la ingesta calórica: Si estás por debajo del peso saludable, es posible que necesites aumentar tu ingesta calórica diaria. Esto puede lograrse agregando comidas y refrigerios nutritivos a lo largo del día. Trata de consumir alimentos con más calorías y nutrientes, como nueces, aguacates, aceites saludables y alimentos ricos en proteínas.
      \nEjercicio físico regular: Incorpora ejercicio regularmente en tu rutina. El ejercicio puede ayudarte a aumentar tu masa muscular y mejorar tu salud en general. Considera actividades que fortalezcan tus músculos, como levantamiento de pesas, y también incluye ejercicios aeróbicos para mejorar tu resistencia cardiovascular.''';
      } else if (imc >= 18.51 && imc <= 24.999) {
        _mensaje = 'Peso normal';
        _mensaje2 = '''\nMantén una alimentación equilibrada: Aunque tu IMC esté en el rango saludable, es importante consumir una dieta balanceada que incluya una variedad de alimentos nutritivos. Prioriza las frutas, verduras, proteínas magras, granos enteros y grasas saludables en tu dieta diaria. Limita el consumo de alimentos procesados, azúcares agregados y grasas saturadas.
        \nEjercicio regular: Incorpora actividad física regular en tu rutina diaria. El ejercicio no solo ayuda a controlar el peso, sino que también beneficia la salud cardiovascular, fortalece los músculos y mejora el estado de ánimo. Trata de realizar al menos 150 minutos de actividad aeróbica moderada o 75 minutos de actividad aeróbica vigorosa cada semana, además de ejercicios de fuerza muscular al menos dos veces por semana.''';
      } else if (imc >= 25 && imc <= 29.99) {
        _mensaje = 'Sobrepeso';
        _mensaje2 = '''\nAlimentación saludable: Adopta una dieta equilibrada y nutritiva. Prioriza alimentos ricos en nutrientes como frutas, verduras, granos enteros, proteínas magras y grasas saludables. Reduce la ingesta de alimentos procesados, azúcares añadidos y grasas saturadas. Controla las porciones de tus comidas y evita comer en exceso.
        \nEjercicio regular: Incorpora actividad física regular en tu rutina diaria. Realiza al menos 150 minutos de actividad aeróbica moderada o 75 minutos de actividad aeróbica vigorosa cada semana, junto con ejercicios de fortalecimiento muscular dos veces por semana. Elige actividades que disfrutes para mantener la motivación.
        \nControl de porciones: Controla el tamaño de las porciones de tus comidas para evitar consumir más calorías de las necesarias. Utiliza platos más pequeños, lee las etiquetas de los alimentos y presta atención a las señales de saciedad de tu cuerpo.''';
      } else if (imc >= 30 && imc <= 34.999) {
        _mensaje = '''Obesidad I''';
        _mensaje2 = '''\nAgregar''';
      } else if (imc >= 35 && imc <= 39.999) {
        _mensaje = 'Obesidad II';
        _mensaje2 = '''\nAgregar''';
      } else {
        _mensaje = 'Obesidad III';
        _mensaje2 = '''\nAgregar''';
      }
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            _imc != Null
                ? Text(
                    'Tu IMC es: ${_imc.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                : SizedBox(),
            SizedBox(height: 10),
            _mensaje.isNotEmpty
                ? Text(
                    'Clasificación: $_mensaje',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                : SizedBox(),
            SizedBox(height: 10),
            _mensaje2.isNotEmpty
                ? Text(
                    'Recomendación: $_mensaje2',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
