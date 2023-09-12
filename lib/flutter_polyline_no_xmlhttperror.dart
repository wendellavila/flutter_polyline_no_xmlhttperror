library flutter_polyline_no_xmlhttperror;

import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_polyline_no_xmlhttperror/src/polyline_generator_mobile.dart'
    if (dart.library.html) 'package:flutter_polyline_no_xmlhttperror/src/polyline_generator_web.dart';

class PolylinePoints {
  String googleAPIKey = "";

  PolylinePoints(this.googleAPIKey);

  Future<List<maps.LatLng>> getPolylinePoints(
      maps.LatLng origin, maps.LatLng destination) async {
    PolylineGenerator polylineGenerator = PolylineGenerator(googleAPIKey);
    return await polylineGenerator.getPolylinePoints(origin, destination);
  }
}
