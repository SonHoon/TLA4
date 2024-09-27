import 'package:flutter/material.dart';
import 'package:son/screen__two.dart';
import 'screen_one.dart';
import 'screen_three.dart';
import 'screen_four.dart';
import 'screen_five.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Theme Switcher',
      theme: _isDarkMode ? _sithTheme() : _jediTheme(),
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  ThemeData _jediTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: const Color(0xFFE3F2FD),
      appBarTheme: const AppBarTheme(
        color: Colors.lightBlue,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.blue),
        trackColor: MaterialStateProperty.all(Colors.lightBlue[100]),
      ),
      colorScheme: const ColorScheme.light(
        primary: Colors.lightBlue,
        secondary: Colors.white,
      ),
    );
  }

  ThemeData _sithTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red[900],
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.red[900],
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.red[400],
          fontSize: 20,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.red),
        trackColor: MaterialStateProperty.all(Colors.red[900]),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 255, 0, 0),
        secondary: Colors.red,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomeScreen({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isDarkMode
            ? 'Welcome to the Dark Side'
            : 'Welcome to the Light Side'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isDarkMode
                  ? 'Welcome to the Dark Side'
                  : 'Welcome to the Light Side',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenOne()),
                );
              },
              child: const Text('Go to Screen One'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenTwo()),
                );
              },
              child: const Text('Go to Screen Two'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenThree()),
                );
              },
              child: const Text('Go to Screen Three'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenFour()),
                );
              },
              child: const Text('Go to Screen Four'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenFive()),
                );
              },
              child: const Text('Go to Screen Five'),
            ),
          ],
        ),
      ),
    );
  }
}
