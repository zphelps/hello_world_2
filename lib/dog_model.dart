
class DogModel {
  String name;
  String age;
  String gender;
  String weight;

  DogModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.weight
  });
}

List<DogModel> dogs = [
  DogModel(name: 'Tibbs', age: '5', gender: 'Male', weight: '6'),
  DogModel(name: 'Doug', age: '5', gender: 'Male', weight: '8'),
  DogModel(name: 'Duke', age: '5', gender: 'Female', weight: '4'),
  DogModel(name: 'Arbys', age: '5', gender: 'Female', weight: '2'),
];