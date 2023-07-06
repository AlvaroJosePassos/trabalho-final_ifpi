import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-22.912953, -43.439989);
  Set<Marker> _marks = {};

  _onMapCreated(GoogleMapController controller) {
    return mapController = controller;
  }

  void _loadMarks() {
    Set<Marker> localMarks = {};
    Marker markerRiver = Marker(
      markerId: MarkerId('River Clube'),
      position: LatLng(-22.888733, -43.305205),
      infoWindow: InfoWindow(
        title: 'River Clube',
      ),
    );
    Marker markerVasco = Marker(
      markerId: MarkerId('Vasco Estadio'),
      position: LatLng(-22.891012, -43.226870),
      infoWindow: InfoWindow(
        title: 'Vasco Estadio',
      ),
    );
    Marker markerAtletico = Marker(
      markerId: MarkerId('Atletico'),
      position: LatLng(-22.980395, -43.217588),
      infoWindow: InfoWindow(
        title: 'Atletico',
      ),
    );
    localMarks.add(markerRiver);
    localMarks.add(markerVasco);
    localMarks.add(markerAtletico);
    setState(() {
      _marks = localMarks;
    });
  }

  @override
  void initState() {
    _loadMarks();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 10,
        ),
        markers: _marks,
      ),
    );
  }
}
