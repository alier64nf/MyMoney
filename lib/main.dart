import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dash_board.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff14ffe9),
          secondary: Color(0xff085795),
          tertiary: Colors.white,
          onTertiary: Colors.black,
          tertiaryContainer: Color(0xffd9d6d6),
        ),
        textTheme: GoogleFonts.robotoCondensedTextTheme(),

          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
          ),
        cardColor: Colors.black38,
      ),

      darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xff023b36),
            secondary: Color(0xff07253d),
            tertiary:Color(0xff02344d),
            onTertiary: Colors.white,
          ),
          textTheme: GoogleFonts.robotoCondensedTextTheme(),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
          ),
        cardColor: Colors.white,
        ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // useMaterial3: true,

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    //Widgets personalizados
    //...Boton de opciones///
    Widget bottomAction(IconData icon) {

      return InkWell(
        hoverColor:  Colors.red,
        child:  Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),

        onTap: () {
          setState(() {
            // isIconclick=true;
          });

        },
      );
    }

    return Scaffold(

        backgroundColor: Theme.of(context).colorScheme.tertiary ,
      //Parte inferior de la applicacion(NavbarBottom and FLoatingbuton)
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          shape: const CircularNotchedRectangle(),
          padding: const EdgeInsets.all(5),
          color: Theme.of(context).colorScheme.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomAction(FontAwesomeIcons.wallet),
              bottomAction(FontAwesomeIcons.buildingColumns),
              const SizedBox(
                width: 48,
              ),
              bottomAction(FontAwesomeIcons.chartColumn),
              bottomAction(Icons.settings),
            ]),
          ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed(),
        tooltip: 'Operacion',
        child: const Icon(Icons.add),
      ),
      body: const Dashboard(), //// This trailing comma makes auto-formatting nicer for build methods
    );
  }

  onPressed() {}
}