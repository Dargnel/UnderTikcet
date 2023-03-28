import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef MarkerPositionCallback = void Function(LatLng markerPosition);
class GoogleMapsWidget extends StatefulWidget {
  final MarkerPositionCallback onMarkerPositionChanged;
  GoogleMapsWidget({Key? key, required this.onMarkerPositionChanged}) : super(key: key);

  @override
  _GoogleMapsWidgetState createState() {
    return _GoogleMapsWidgetState();
  }
}



class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  String placeControler ="37.422, -122.084";
  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers = [
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
  ].toSet();


  Marker? _marker;

  final Marker defaultMarker = Marker(
    markerId: MarkerId("default_marker"),
    position: LatLng(37.422, -122.084),
  );

  void _addMarker(LatLng latLng) {
    final marker = Marker(
      markerId: MarkerId("marker_${_marker}"),
      position: latLng,

    );
    setState(() {
      _marker = (marker);
    });
    widget.onMarkerPositionChanged(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.422, -122.084),
          zoom: 14.0,
        ),
        scrollGesturesEnabled: true,
        onTap: _addMarker,
        markers: _marker == null ? Set.of([defaultMarker!]) :Set.of([_marker!]),
        gestureRecognizers: _gestureRecognizers,
      ),
    );
  }
}