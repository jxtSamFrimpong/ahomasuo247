import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTrial extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    var message = Provider.of<Counter>(context, listen: true).getCounter;
    var increase = Provider.of<Counter>(context, listen: true).getIncreaseCount;
    var decrease = Provider.of<Counter>(context, listen: true).getDecreaseCount;

    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Center(child: Text('you have counted a total number of ')),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$message',
                        style: Theme.of(context).textTheme.headline4
                    ),
                    Text('times')
                  ],
                ),
              ),

              Spacer(),
              Text('you have tapped decrease button ${decrease.toString()} times'),
              Spacer(),
              Text('you have tapped increase button ${increase.toString()} times')
            ]
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
              left: 40,
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
  var _incrementCount = 0;
  var _decrementCount = 0;

  int get getCounter {
    return _count;
  }

  int get getIncreaseCount{
    return _incrementCount;
  }

  int get getDecreaseCount {
    return _decrementCount;
  }

  void incrementCounter() {
    _count += 1;
    _incrementCount += 1;
    notifyListeners();
    //print(_count);
  }

  void decreamentCounter(){
    _count -= 1;
    _decrementCount += 1;
    notifyListeners();
    //print(_count);
  }
}

