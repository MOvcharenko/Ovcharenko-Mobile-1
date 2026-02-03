// Part 1. Functions

// 1) Create at least 3 arrow functions (=>) with different return types (int, bool, String).
int multiply(int a, int b) => a * b;
bool isPositive(int number) => number > 0;
String sayHello(String name) => 'Hello, $name!';

// 3) Demonstrate functions with named and unnamed parameters.
// Unnamed (positional) parameters
int subtract(int a, int b) => a - b;

// Named parameters (optional `age`, required `name` and `city`)
void printUserInfo({required String name, int? age, required String city}) {
  String ageInfo = age != null ? ' (Age: $age)' : '';
  print('User: $name from $city$ageInfo');
}

// Part 2. Classes & Inheritance

// 1) Create a base class with:
//    - at least 2 fields
//    - a constructor with required parameters
//    - 1 method that returns a String summary
class Vehicle {
  final String brand;
  final int year;

  Vehicle(this.brand, this.year);

  String getSummary() {
    return 'This is a $year $brand vehicle.';
  }
}

// 2) Create a child class using extends:
//    - add at least 1 new field
//    - override the parent method using @override
class Car extends Vehicle {
  final String model;

  Car(String brand, int year, this.model) : super(brand, year);

  @override
  String getSummary() {
    return 'This is a $year $brand $model car.';
  }
}

// Part 3. Enums

// 1) Create an enum with at least 4 values
enum AppState {
  loading,
  success,
  error,
  empty,
}

// 2) Use switch on enum value to produce different messages:
String getMessage(AppState state) {
  switch (state) {
    case AppState.loading:
      return 'Loading data... Please wait.';
    case AppState.success:
      return 'Operation completed successfully.';
    case AppState.error:
      return 'Something went wrong.';
    case AppState.empty:
      return 'No data available.';
  }
}

// Part 4. Mixins

// 1) Create a mixin with at least 1 method
mixin Loggable {
  void log(String message) {
    print('[LOG] ${DateTime.now()}: $message');
  }
}

// 2) Apply it to at least 2 different classes using with.
class DataService with Loggable {
  void fetchData() {
    log('Fetching data from remote server.');
    // Simulate data fetching...
    log('Data fetch complete.');
  }
}

class ReportGenerator with Loggable {
  void generateReport(String reportName) {
    log('Starting report generation for: "$reportName".');
    // Simulate report generation...
    log('Report "$reportName" generated successfully.');
  }
}

// Part 5. Null Safety Basics

// 3) Create a small model class with nullable fields
class UserProfile {
  String? nickname;
  int? age;
  String? email; // Added another nullable field for more demo scenarios

  UserProfile({this.nickname, this.age, this.email});

  @override
  String toString() {
    return 'UserProfile(nickname: $nickname, age: $age, email: $email)';
  }
}

void main() {
  print('--- Part 1: Functions ---');
  // 4) Call each function from Part 1 main file and print results.
  // Arrow functions
  print('Multiply 5 and 3: ${multiply(5, 3)}'); // int
  print('Is 10 positive? ${isPositive(10)}'); // bool
  print('Is -5 positive? ${isPositive(-5)}'); // bool
  print(sayHello('Alice')); // String

  // Unnamed parameters
  print('Subtract 10 from 20: ${subtract(20, 10)}');

  // Named parameters
  printUserInfo(name: 'Bob', city: 'New York');
  printUserInfo(name: 'Charlie', age: 25, city: 'London');

  // 2) Demonstrate anonymous functions.
  List<int> numbers = [1, 2, 3, 4, 5];
  print('\nAnonymous function demo (forEach):');
  numbers.forEach((number) {
    print('Number from list: $number');
  });

  // Anonymous function assigned to a variable
  Function(int) square = (x) => x * x;
  print('Anonymous function assigned to variable: square(7) = ${square(7)}');

  print('\n--- Part 2: Classes & Inheritance ---');
  // 3) Create objects of both classes in Part 2 main file and print outputs.
  final Vehicle genericVehicle = Vehicle('Generic Motors', 2020);
  print(genericVehicle.getSummary());

  final Car myCar = Car('Toyota', 2023, 'Camry');
  print(myCar.getSummary());

  print('\n--- Part 3: Enums ---');
  // 3) Print results for at least 2 different enum values.
  print(getMessage(AppState.loading));
  print(getMessage(AppState.success));
  print(getMessage(AppState.error)); // Demonstrating another enum value
  print(getMessage(AppState.empty)); // Demonstrating another enum value

  print('\n--- Part 4: Mixins ---');
  // 3) Call mixin method(s) from both classes and print results.
  final dataService = DataService();
  dataService.fetchData();

  final reportGenerator = ReportGenerator();
  reportGenerator.generateReport('Monthly Sales Report');

  print('\n--- Part 5: Null Safety Basics ---');
  // 1) Demonstrate nullable vs non-nullable types:
  //    - declare and use at least 2 non-nullable variables
  //    - declare and use at least 2 nullable variables (with ?)
  String nonNullableName = 'David';
  int nonNullableAge = 40;
  print('Non-nullable: Name: $nonNullableName, Age: $nonNullableAge');

  String? nullableString; // Declared null
  int? nullableInt = 100; // Declared with a value
  double? nullableDouble = null; // Explicitly null
  print('Nullable: String: $nullableString, Int: $nullableInt, Double: $nullableDouble');

  // 2) Use null safety operators:
  //    - ?. (safe access)
  print('Safe access (?.): nullableString length: ${nullableString?.length}'); // null
  int? resultOfNullableIntAdd;
  if (nullableInt != null) {
    resultOfNullableIntAdd = nullableInt + 5;
  }
  print('Safe access with check: nullableInt + 5: $resultOfNullableIntAdd'); // 105

  //    - ?? (default value)
  String displayName = nullableString ?? 'Default User';
  print('Default value (??): Display name: $displayName');

  int actualAge = nullableInt ?? 0;
  print('Default value (??): Actual age: $actualAge');

  int? anotherNullableInt;
  print('Default value (??) with another null: ${anotherNullableInt ?? -1}');

  //    - ??= (assign if null)
  nullableString ??= 'Assigned Default';
  print('Assign if null (??=): nullableString: $nullableString'); // Now "Assigned Default"

  int? x;
  x ??= 10;
  print('Assign if null (??=) for x: $x'); // 10
  x ??= 20; // Will not assign, as x is not null
  print('Assign if null (??=) for x again: $x'); // Still 10

  //    - ! (null assertion) — only after a null check
  if (nullableString != null) {
    print('Null assertion (!): Upper case nullableString: ${nullableString!.toUpperCase()}'); // "ASSIGNED DEFAULT"
  }

  // 4) Show correct behavior for both:
  //    - object with values present
  //    - object with null values
  UserProfile userWithValues = UserProfile(nickname: 'CodeMaster', age: 35, email: 'code@example.com');
  print('\nUser with values:');
  print(userWithValues);
  print('Nickname length (safe access): ${userWithValues.nickname?.length}'); // 10
  print('Age (default value): ${userWithValues.age ?? 0}'); // 35
  if (userWithValues.email != null) {
    print('Email local part (null assertion): ${userWithValues.email!.split('@')[0]}'); // "code"
  }

  UserProfile userWithNulls = UserProfile();
  print('\nUser with null values:');
  print(userWithNulls);
  print('Nickname length (safe access): ${userWithNulls.nickname?.length}'); // null
  print('Age (default value): ${userWithNulls.age ?? 0}'); // 0
  userWithNulls.email ??= 'no-email@example.com'; // Assign if null
  print('Email after ??=: ${userWithNulls.email}'); // "no-email@example.com"
  
  // Demonstrating null assertion cautiously:
  // This would throw a runtime error if nickname is null without a check
  // print(userWithNulls.nickname!.toUpperCase()); 
  if (userWithNulls.nickname != null) {
    print('Nickname (null assertion): ${userWithNulls.nickname!.toUpperCase()}');
  } else {
    print('Nickname is null for userWithNulls, cannot assert.');
  }
}
