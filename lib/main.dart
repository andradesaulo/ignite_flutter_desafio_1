import 'package:flutter/material.dart';

class Themes {
  static ThemeData get dark => ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ),
  );

  static ThemeData get light => ThemeData(
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.purpleAccent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.purple
    ),
  );
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Contador"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

class BodyWidget extends StatelessWidget {
  final count;

  const BodyWidget(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      "Contagem: $count",
      style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  final onPressedFunction;

  const FloatingActionButtonWidget(this.onPressedFunction);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressedFunction,
      child: Icon(Icons.add),
    );
  }
}

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu primeiro aplicativo",
      home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;

  setStateFunction() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: BodyWidget(count),
      floatingActionButton: FloatingActionButtonWidget(setStateFunction),
    );
  }
}