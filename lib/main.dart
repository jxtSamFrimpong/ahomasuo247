import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'views/practise/providertrial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
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
        home: Scaffold(
          drawer: Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),

                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              )
          ),
          //body: MyHomePage(title: 'Flutter Demo Home Page'),
          body: MyHomePage(title: ''),
        ),
      ),
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),

        ChangeNotifierProvider.value(value: HeaderController()),
      ]
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
  PanelController _panelController = PanelController();

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
            body: GestureDetector(
              onTap: (){
                if(_panelController.isPanelOpen){
                  _panelController.close();
                }
              },
              child: PageView(

                  pageSnapping: true,

                  children: <Widget>[
                    Container(
                      child: Center(child: Text('accepted bids')),
                      color: Colors.greenAccent,
                    ),
                    Container(
                      child: Center(child: Text('current order delivering/to add')),
                      color: Colors.pinkAccent,
                    ),
                    Container(
                      child: Center(child: Text('orders near me*')),
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
            ),


            panel: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          child: Icon(Icons.star),
                          onPressed: ()async{
                            if(_panelController.isPanelClosed){
                              await _panelController.open();
                            }else{
                              print('already opened');
                            }
                          }),

                      MaterialButton(
                          child: Icon(Icons.message),
                          onPressed: ()async{
                            if(_panelController.isPanelClosed){
                              await _panelController.open();
                            }else{
                              print('already opened');
                            }
                          }),

                      MaterialButton(
                          child: Icon(Icons.add_a_photo_outlined),
                          onPressed: ()async{
                            if(_panelController.isPanelClosed){
                              await _panelController.open();
                            }else{
                              print('already opened');
                            }
                          })
                    ],
                  ),
                ],
              )
            ),

            //collapsed: Text('collapsed'),

            // header: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     MaterialButton(
            //         child: Icon(Icons.star),
            //         onPressed: ()async{
            //           if(_panelController.isPanelClosed){
            //             await _panelController.open();
            //           }else{
            //             print('already opened');
            //           }
            //     })
            //   ],
            // ),

            controller: _panelController,

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
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )
          )
        ],
      );

  }
}

class HeaderController extends ChangeNotifier{
  String _acc = 'accepted';
  String _bid = 'bid';
  String _jour = 'journey';

  late String _prevCall;
  late String _currCall;


  void set _setPrevCall(String val){
    this._prevCall = val.toString();
    notifyListeners();
  }

  void set _setCurrCall(String val){
    this._currCall = val.toString();
    notifyListeners();
  }



}
