library flutter_polyline_no_xmlhttperror;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_polyline_no_xmlhttperror/src/polyline_generator_mobile.dart';
import 'package:flutter_polyline_no_xmlhttperror/src/polyline_generator_web.dart';

class PolylineGenerator {
  String googleAPIKey = "";

  PolylineGenerator(this.googleAPIKey);

  Future<List<maps.LatLng>> getPolylinePoints(
      maps.LatLng origin, maps.LatLng destination, String googleAPIKey) async {
    if (kIsWeb) {
      PolylineGeneratorWeb polylineGenerator = PolylineGeneratorWeb();
      return await polylineGenerator.getPolylinePoints(origin, destination);
    } else {
      PolylineGeneratorMobile polylineGenerator =
          PolylineGeneratorMobile(googleAPIKey);
      return await polylineGenerator.getPolylinePoints(origin, destination);
    }
  }
}
