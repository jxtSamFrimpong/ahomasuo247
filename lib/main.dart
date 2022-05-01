import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingUpPanel(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          //border: const Border(),
          body: Scaffold(
            // appBar: AppBar(
            //   // Here we take the value from the MyHomePage object that was created by
            //   // the App.build method, and use it to set our appbar title.
            //   title: Text(widget.title),
            // ),

            body: PageView(

              pageSnapping: true,

              children: <Widget>[
                Container(
                  color: Colors.pink,
                ),
                Container(
                  color: Colors.cyan,
                ),
                Container(
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),

          panel: Center(
            child: Text('ok'),
          ),

          //collapsed: Text('collapsed'),

          header: Container(
              child: Center(child: Text('header')
              ),
              // decoration: BoxDecoration(
              //     color: Colors.greenAccent,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(24.0),
              //       topRight: Radius.circular(24.0),
              //     )
              // )
          )
          ,

          //minHeight: 50.0,

          //margin: const EdgeInsets.all(24.0),

          backdropTapClosesPanel: true,
          backdropOpacity: 0.0,

          onPanelOpened: (){
            print('fully opened');
          },

          onPanelClosed: (){
            print('fully closed');
          },

          isDraggable: true,

          defaultPanelState: PanelState.CLOSED,

        ),

    Positioned(
    right: 40,
    top: 40,
    child: FloatingActionButton(
      child: Icon(Icons.alarm),
    onPressed: () {},
    )
    ),

        Positioned(
            left: 40,
            top: 40,
            child: FloatingActionButton(
              child: Icon(Icons.menu),
              onPressed: () {},
            )
        )
      ],
    );
  }
}
