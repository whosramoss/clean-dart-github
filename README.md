# Flutter State Management Structs

A biggest problem when someone getting into Flutter development was figuring out how to manage code. 

Native Android development splits UI code and Logic code between XML files and Java (or Kotlin) files respectively, but with Flutter it can all become a jumbled mess if you’re not careful. After working with Flutter for almost two years, this has been written as a simple guide to architecture your app in the best way possible for future refactoring and readability.

Check sample projects with [fluttersamples](https://fluttersamples.com/)

## Bloc 

### The main.dart
The foundation of any Flutter app, the main.dart file, should hold very little code and only serve as an overview to an app.
The widget being run by the runApp function should be a StatelessWidget, and the widget itself should be no more complicated than a simple MaterialApp/CupertinoApp/WidgetsApp wrapped in a BlocProviderTree.
The MaterialApp itself should have no heavy code in it, instead importing the theme, routes, etc. from other files.

```dart
import 'package:flutter/material.dart';
import 'package:example/theme/style.dart';
import 'package:example/routes.dart';
import 'package:example/bloc/bloc-prov-tree.dart';
import 'package:example/bloc/bloc-prov.dart';
import 'package:example/blocs/blocs.dart';
import 'blocs/blocs.dart';

void main() {
  runApp(ExampleApp());
}
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<AuthBloc>(bloc: AuthBloc()),
        BlocProvider<PrefBloc>(bloc: PrefBloc()),
      ],
      child: MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
```

## The routes.dart
To further simplify the main.dart file, a separate routes.dart file should exist 
which only holds the ```dart Map<String, WidgetBuilder>``` as a simple map of all of the app’s routes.
```dart
import 'package:flutter/widgets.dart';
import 'package:example/screens/example1/examplescreen1.dart';
import 'package:example/screens/example2/examplescreen2.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => ExScreen1(),
  "/ExScreen2": (BuildContext context) => ExScreen2(),
};
```

## Folders

```dart
📁 lib
- 📝 main.dart
- 📝 routes.dart
- 📁 components // has custom widgets which are used by multiple different screens
- 📁 models     // contains files each with a custom class of an object widely used throughout the app
- 📁 screens
- 📁 services   // holds some web APIs and native interaction code
- 📁 themes     // just contains a style.dart with the app theme which is accessed in the main.dart file
- 📁 blocs      // is pretty straightforward, holding multiple general bloc files (all of which extend the abstract Bloc class mentioned above) and a blocs.dart which acts as a single file exporting all the folder’s blocs (I used this video to learn how to structure the bloc files).
- 📁 bloc       // holds an abstract class in bloc.dart as well as bloc-prov.dart and a bloc-prov-tree.dart both of which are based off of code found here
```

The screens folder holds many different folders, each of which corresponds to a different screen of the app. Each screen folder holds three things: a primary screen file which serves to organize each component, a BLoC file that is only used for that screen, and a “components” folder that holds each component file used by the screen. Any section of a screen more complicated then a few widgets should be its own component, and some very complex components may even require their own BLoC file and components as a screen does.
