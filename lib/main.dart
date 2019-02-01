import 'package:flutter/material.dart';
import 'package:myapp/FavouriteWidget.dart';
import 'package:myapp/Todo.dart';
import 'package:myapp/TodoScreen.dart';

// void main() => runApp(LakeApp());

//void main() {
//  runApp(MaterialApp(
//    home: LakeApp(),
//    title: 'Lake App',
//  ));
//}

//void main() {
//  runApp(
//    MaterialApp(
//      title: 'Hello Rectangle',
//      home: Scaffold(
//        body: TodosScreen(),
//      ),
//    ),
//  );
//}

// To-do Screen

//void main() {
//  runApp(MaterialApp(
//    title: 'A',
//    home: TodoListScreen(todos: List.generate(20,
//            (i) => Todo('Todo $i', 'Description'))),
//  ));
//}

// Routing - https://flutter.io/docs/development/ui/navigation
// Named Routes - https://flutter.io/docs/cookbook/navigation/named-routes

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/initial',
    routes: {
      '/initial': (context) =>
          TodoListScreen(todos: List.generate(20,
                  (i) => Todo('Todo $i', 'Description'))),
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
      '/selectionScreen': (context) => SelectionScreen(),

    },

  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),

    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.pushNamed(context, '/selectionScreen');
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: () {
                Navigator.pop(context, 'Yep!');
              }, child: Text('Yep!')),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: () {
                Navigator.pop(context, 'Nope!');
              }, child: Text('Nope!')),
            ),

          ],
        ),
      ),
    );
  }

}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');

//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondScreen()),
//            );
          },
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


class LakeApp extends StatelessWidget {


  final Widget titleSection = Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        FavouriteWidget(),
      ],
    ),
  );


  Column _buildBottomColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: color
            ),
          ),

        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildBottomColumn(color, Icons.call, 'CALL'),
          _buildBottomColumn(color, Icons.near_me, 'ROUTE'),
          _buildBottomColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Laypout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children:[
            Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}


