<!--
For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
Workaround for flutter_polyline_points on Flutter Web

## Features
Uses Maps JS API on web to retrieve coordinates, avoiding XMLHttpRequest errors caused by flutter_polyline_points.
On other platforms, flutter_polyline_points is used as usual.

## Getting started
Add package to pubspec.yaml:
```
dependencies:
    flutter_polyline_no_xmlhttperror:
        git:
            url: https://github.com/wendellavila/flutter_polyline_no_xmlhttperror
            ref: main
```

## Usage
```dart
import 'package:flutter_polyline_no_xmlhttperror/flutter_polyline_no_xmlhttperror.dart'
```

```dart
String googleAPIKey = ""; //Your Google API Key

LatLng origin = LatLng(0, 0);
LatLng destination = LatLng(1, 1);

PolylineGenerator polylineGenerator = PolylineGenerator(googleAPIKey);
List<LatLng> polylineCoordinates =
    await polylineGenerator.getPolylinePoints(origin, destination);
```