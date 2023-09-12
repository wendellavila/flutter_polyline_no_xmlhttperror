<!--
For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
Workaround for [flutter_polyline_points](https://pub.dev/packages/flutter_polyline_points) on Flutter Web

## Features
Uses Maps JS API on Flutter Web to retrieve coordinates, avoiding XMLHttpRequest errors caused by flutter_polyline_points.
On other platforms, flutter_polyline_points is used as usual.

## Getting started
Add package to pubspec.yaml:
```yaml
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

LatLng origin = LatLng(37.769904068414945, -122.44706008798406);
LatLng destination = LatLng(37.75098221997195, -122.50814232027015);

PolylinePoints polylineGenerator = PolylinePoints(googleAPIKey);
List<LatLng> polylineCoordinates =
    await polylineGenerator.getPolylinePoints(origin, destination);
```
