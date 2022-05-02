import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTrial extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    var message = Provider.of<Counter>(context).getCounter;

    return Container(
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Text('you have counted this number of times in total'),
                Text('$message',
                    style: Theme.of(context).textTheme.headline4)
              ]
            ),
          ),

          Positioned(
              right: 40,
              top: 40,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Provider.of<Counter>(context, listen: false).incrementCounter();
                },
              )
          ),

          Positioned(
              right: 40,
              top: 40,
              child: FloatingActionButton(
                child: Icon(Icons.minimize_rounded),
                onPressed: () {
                  Provider.of<Counter>(context, listen: false).decreamentCounter();
                },
              )
          )
        ],
      ),
    );
  }
}

class Counter extends ChangeNotifier{
  var _count = 0;

  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
  }

  void decreamentCounter(){
    _count -= 1;
  }
}

