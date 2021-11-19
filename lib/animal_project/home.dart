import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_2/animal_project/models/dog.dart';
import 'package:hello_world_2/animal_project/sort_dogs.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'animals_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? filterCriteria = {
    'ages': 'Baby',
    'sizes': 'Small',
    'coats': 'Short',
  };

  String query = 'age=Baby&size=Small&coat=Short';

  late Future<List<Dog>> dogs;

  Future<List<Dog>> fetchDogData(String query) async {
    try{
      final authorizationEndpoint =
      Uri.parse('https://api.petfinder.com/v2/oauth2/token');

      const identifier = '1NvMYFu5tsDNWhPjE9YN3gfexGpHsRemN84rIlxtxtYwieVUAy';
      const secret = 'hQZNN7oZAvv4Ph9SS5uZQBxDBqjzYNMSSSfU5KsM';

      var client = await oauth2.clientCredentialsGrant(
          authorizationEndpoint, identifier, secret);

      var response =
      await client.read(Uri.parse('https://api.petfinder.com/v2/animals?type=dog&$query&limit=100'));
      // make the request
      // Response response = await get(Uri.parse('https://api.petfinder.com/v2/animals?type=dog&status=adopted'), headers: {
      //   'Authorization': 'Bearer $token',
      // });
      Map data = jsonDecode(response);

      List<Dog> dogs = [];

      for(dynamic dog in data['animals']) {
        if(dog['photos'].length > 0 && dog['description'] != null) {
          dogs.add(Dog(
            name: dog['name'],
            imageURL: dog['photos'].length > 0 ? dog['photos'][0]['full'] : 'https://i1.wp.com/fremontgurdwara.org/wp-content/uploads/2020/06/no-image-icon-2.png',
            breed: dog['breeds'] != null ? dog['breeds']['primary'] : 'Unknown',
            age: dog['age'],
            gender: dog['gender'],
            description: dog['description'],
          ));
        }
      }
      return dogs;

    }
    catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    dogs = fetchDogData(query);
  }

  @override
  Widget build(BuildContext context) {
    filterCriteria = filterCriteria!.isNotEmpty ? filterCriteria : ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 16),
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/sort');
                if(result != null) {
                  setState(() {
                    filterCriteria = {
                      'ages': result!['ages'],
                      'coats': result!['coats'],
                      'sizes': result!['sizes'],
                    };
                    query = 'age=${filterCriteria!['ages']}&size=${filterCriteria!['sizes']}&coat=${filterCriteria!['coats']}';
                  });
                  dogs = fetchDogData(query);
                }
              },
            )
          ],
          title: const Text(
            'Available Dogs',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ), systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: FutureBuilder(
          future: dogs,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData) {
              return AnimalsList(dogs: snapshot.data);
            }
            else {
              return const Center(
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballRotateChase,
                    colors: [Colors.blue, Colors.blueGrey, Colors.grey],
                  ),
                ),
              );
            }
          },
        ),
    );
  }
}
