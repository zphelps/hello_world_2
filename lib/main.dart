import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_2/animal_list.dart';
import 'package:hello_world_2/animal_project/animals_list.dart';
import 'package:hello_world_2/animal_project/home.dart';
import 'package:hello_world_2/animal_project/sort_dogs.dart';
import 'package:hello_world_2/dog_model.dart';
import 'package:hello_world_2/traffic_light.dart';

void main() {
  runApp(MaterialApp(
    // home: AnimalProfile(dog: dogs[0],),
    initialRoute: '/',
    onGenerateRoute: (RouteSettings settings) {
      switch (settings.name) {
        case "/":
          return MaterialPageRoute(
            builder: (context) => Home()
          );
        case "/class":
          return MaterialPageRoute(
            builder: (context) => AnimalProfile(dog: dogs[0])
          );
        case '/sort':
          return MaterialPageRoute(
            builder: (context) => SortDogs(),
            fullscreenDialog: false
          );
      }
    }
  ));
}


class AnimalProfile extends StatelessWidget {
  const AnimalProfile({required this.dog});

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Dog Profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage('https://g.petango.com/photos/352/1653a7b4-28ec-48f4-863c-d56fe6ce20aa.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 30.0,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              dog.name,
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'AGE',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '${dog.age} years',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'SEX',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              dog.gender,
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'WEIGHT',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '${dog.weight} lbs',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.info_outlined,
                  color: Colors.grey[400],
                  size: 18,
                ),
                SizedBox(width: 5.0),
                Text(
                  'ANIMAL ID: 42957366',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     toolbarHeight: 45,
    //     title: const Text(
    //       'Available Dogs',
    //       style: TextStyle(
    //         fontSize: 17,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     backgroundColor: Colors.blueGrey,
    //
    //   ),
    //   // body: AnimalsList(),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           height: 100,
    //           width: 100,
    //           color: Colors.red,
    //         ),
    //         Container(
    //           height: 100,
    //           width: 100,
    //           color: Colors.green,
    //         ),
    //         Container(
    //           height: 100,
    //           width: 100,
    //           color: Colors.blue,
    //         ),
    //         Image(
    //           width: 100,
    //           height: 100,
    //           image: AssetImage('assets/stoplight.png'),
    //         ),
    //         SizedBox(height: 50,),
    //         Icon(
    //           Icons.account_circle_sharp,
    //           size: 50,
    //           color: Colors.red,
    //         ),
    //         OutlinedButton(
    //           onPressed: () {
    //             print('Button Pressed');
    //           },
    //           child: Text(
    //             'Button',
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
