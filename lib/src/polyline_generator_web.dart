import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps/google_maps.dart' as maps_js;
import 'package:flutter_polyline_points/flutter_polyline_points.dart'
    as polyline_points;

class PolylineGenerator {
  String googleAPIKey = ""; //Your Google Maps API key

  PolylineGenerator(this.googleAPIKey);

  Future<List<maps.LatLng>> getPolylinePoints(
      maps.LatLng origin, maps.LatLng destination) async {
    //Converting from google_maps_flutter/LatLng to google_maps/LatLng
    maps_js.LatLng originConverted =
        maps_js.LatLng(origin.latitude, origin.longitude);
    maps_js.LatLng destinationConverted =
        maps_js.LatLng(destination.latitude, destination.longitude);

    final List<maps.LatLng> polylineCoordinates = [];
    final maps_js.DirectionsService directions = maps_js.DirectionsService();
    final maps_js.DirectionsRequest request = maps_js.DirectionsRequest()
      ..origin = originConverted
      ..destination = destinationConverted
      ..travelMode = maps_js.TravelMode.DRIVING
      ..unitSystem = maps_js.UnitSystem.METRIC
      ..avoidFerries = true
      ..avoidHighways = false
      ..avoidTolls = false
      ..provideRouteAlternatives = false
      ..optimizeWaypoints = false;

    await directions.route(request, (response, status) {
      if (status == maps_js.DirectionsStatus.OK) {
        final myRoute = response!.routes![0]!.legs![0]!;
        final polyline_points.PolylinePoints polylinePoints =
            polyline_points.PolylinePoints();

        for (final step in myRoute.steps!) {
          final List<polyline_points.PointLatLng> decodedPoints =
              polylinePoints.decodePolyline(step!.encodedLatLngs!);
          for (final polyline_points.PointLatLng point in decodedPoints) {
            polylineCoordinates
                .add(maps.LatLng(point.latitude, point.longitude));
          }
        }
      }
    });
    return polylineCoordinates;
  }
}
