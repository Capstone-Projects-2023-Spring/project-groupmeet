import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      home: const MyHomePage(title: 'GroupMeet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage("https://cdn.pixabay.com/photo/2016/09/09/23/27/the-ostrich-1658267_960_720.jpg"),
            ),
            Container(
                child: Column(
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                        )
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                      obscureText: true,
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text("Click here to register"),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
