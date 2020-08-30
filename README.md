# Flutter: Code Organization

A biggest problem when someone getting into Flutter development was figuring out how to manage my code. 

Native Android development splits UI code and Logic code between XML files and Java (or Kotlin) files respectively, but with Flutter it can all become a jumbled mess if you’re not careful. After working with Flutter for more than a year, this has been written as a simple guide to architecting your app in the best way possible for future refactoring and readability.

## The main.dart
The foundation of any Flutter app, the main.dart file, should hold very little code and only serve as an overview to an app.
The widget being run by runApp should be a StatelessWidget, and the itself should be no more complicated than a simple MaterialApp wrapped in the necessary BLoC providers.
The MaterialApp itself should have no heavy code in it, instead pulling the Theme and the widget screens from other files.

## SubFolders
* The ```theme``` folder just contains a style.dart with my app theme which I access in the main.dart file
* The ```services``` folder holds some web APIs and native interaction code
* The ```components``` folder has custom widgets which are used in multiple different screens
* The ```models``` folder contains files each with a custom class of an object widely used throughout the app
* The ```blocs``` and blocprovs folders are both pretty straightforward, with each holding a file with a BLoC and a BLoC Provider in it respectively (I used this and this video to learn how to structure the files).

The screens folder holds many different folders, each of which corresponds to a different screen of the app. Each screen folder holds two things: a primary screen file which serves to organize each component, and a “components” folder which holds each component in its own separate file. Any piece of a screen more complicated then a few widgets should be its own component.
