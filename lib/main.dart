import 'package:flutter/material.dart';

//Todo: Constructors & Inheritance
//Class creation with constructor
class Spacecraft{
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  //Constructor
  Spacecraft(this.name, this.launchDate){

  }

  //Named constructor that forwards to the default one
  Spacecraft.unlaunched(String name) : this(name,null);

  void describe(){
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if(launchDate!=null){
      int years = (DateTime.now().difference(launchDate).inDays / 365).toInt();
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }

}

//Todo: Inheritance

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);

  void describe(){
    print('Spacecraft: $name');

    var launchDate = this.launchDate;

    int years = (DateTime.now().difference(launchDate!).inDays / 365).toInt();
    print('Launched: $launchYear ($years years ago)');

    print('Altitude: $altitude');
  }
}

//Todo: Interfaces
// class Shape (interface)
class Shape {
  void display() {
    print('Method in Shape class');
  }
}

// class Triangle implementing class Shape
class Triangle implements Shape {

  void display() {
    print('Triangle >>> This is the method of the implemented class');
  }
}

//Todo: example abstract class

abstract class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound();

  void printDescription() {
    print('Name: $name');
    print('Age: $age');
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  void makeSound() {
    print('Woof woof!');
  }
}

class Cat extends Animal {
  String color;

  Cat(String name, int age, this.color) : super(name, age);

  void makeSound() {
    print('Meow!');
  }
}

//Todo: Singleton
//The Singleton class also contains a static getter instance,
// which is responsible for creating and returning the singleton instance.
// If the _instance variable is null, it creates a new instance of Singleton,
// otherwise, it returns the existing instance.

class Me {
  static final Me _singleton = new Me._internal();
  static final String _name = "Tyler";

  factory Me() {
    return _singleton;
  }

  //getter
  static String get name => _name;

  @override
  String toString() => "Hello, my name is $name.";

  Me._internal();
}

//Todo: Factory
// factory constructor is a special type of constructor that can
//return an instance of a class from a different source or
// with specific logic
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }

  void introduceYourself() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

void main() {
  //runApp(const MyApp());

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  var orbiter = Orbiter('Orbiter 1', DateTime(1999,1,1), 128);
  orbiter.describe();

  //for interface testing
  print("INTERFACE");

  // creating instance of Class Triangle
  var triangle = Triangle();

  // Invoke method of class Shape
  // using class Triangle instance
  triangle.display();

  //for abstract class testing
  print("ABSTRACT");

  var dog = Dog('Buddy', 3, 'Labrador');
  var cat = Cat('Whiskers', 5, 'Gray');

  dog.printDescription();
  dog.makeSound();

  cat.printDescription();
  cat.makeSound();

  print("SINGLETON");

  var tyler = Me();
  var anotherTyler = Me();

  print(tyler);
  print(anotherTyler);

  var samenessCheck = identical(tyler, anotherTyler)
      ? "We are both the same ${Me.name}."
      : "We are NOT the same. I mean, just look at us.";
  print(samenessCheck);

  print("FACTORY");

  Map<String, dynamic> json = {'name': 'John Doe', 'age': 30};
  var person = Person.fromJson(json);
  person.introduceYourself();

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
