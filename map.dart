import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'หน้าแรก',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'ค้นหา',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.77483, -122.41942),
        zoom: 14.0,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('หน้าค้นหา'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          brightness: Brightness.dark,
        ),
        body: _selectedIndex == 0
            ? Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              )
            : _selectedIndex == 1
                ? MapShop()
                : Center(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าแรก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'แผนที่',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'บัญชีของฉัน',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ));
  }
}

class MapShop extends StatefulWidget {
  @override
  _MapShopState createState() => _MapShopState();
}

class _MapShopState extends State<MapShop> {
  GoogleMapController? _controller;

  final LatLng _center = const LatLng(37.77483, -122.41942);

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 14.0,
      ),
    );
  }
}
