import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mead_term_2/components/activeWorkouts.dart';
import 'package:mead_term_2/services/auth.dart';
import 'package:mead_term_2/screens/add-workout.dart';
import 'package:mead_term_2/components/workouts_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
      items: const <Widget>[Icon(Icons.fitness_center), Icon(Icons.search)],
      index: 0,
      height: 50,
      color: Colors.white.withOpacity(0.5),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.5),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(microseconds: 500),
      onTap: (int index) {
        setState(() => sectionIndex = index);
      },
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('I done MT-2 // ' +
            (sectionIndex == 0 ? 'Active Workouts' : 'Find Workouts')),
        leading: Icon(Icons.fitness_center),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                AuthServices().logOut();
              },
              icon: Icon(Icons.supervised_user_circle, color: Colors.white),
              label: SizedBox.shrink())
        ],
      ),
      body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
      bottomNavigationBar: navigationBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddWorkout()));
        },
      ),
    );
  }
}
