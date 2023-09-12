import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_polyline_points/flutter_polyline_points.dart'
    as polyline_points;

const String googleAPIKey = ""; //Your Google Maps API key

Future<List<maps.LatLng>> getPolylinePoints(
    maps.LatLng origin, maps.LatLng destination) async {
  polyline_points.PolylinePoints polylinePoints =
      polyline_points.PolylinePoints();
  List<maps.LatLng> polylineCoordinates = [];

  polyline_points.PolylineResult result =
      await polylinePoints.getRouteBetweenCoordinates(
    googleAPIKey, // Google Maps API Key
    polyline_points.PointLatLng(origin.latitude, origin.longitude),
    polyline_points.PointLatLng(destination.latitude, destination.longitude),
    travelMode: polyline_points.TravelMode.driving,
  );

  if (result.points.isNotEmpty) {
    for (polyline_points.PointLatLng point in result.points) {
      polylineCoordinates.add(maps.LatLng(point.latitude, point.longitude));
    }
  } else {
    print(result.errorMessage);
  }
  return polylineCoordinates;
}
