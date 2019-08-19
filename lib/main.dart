import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List<Marker> allMarkers = [];

    GoogleMapController _controller;

      String searchAddr;

@override
  void initState() {
    super.initState();

    allMarkers.add(Marker(
        markerId: MarkerId('Meu Marcador'),
        draggable: true,
        onTap: () {
          print('Marcador Tocado');
        },
        position: LatLng(-9.66583, -35.73528)
        )
     );
  }
  @override
  Widget build(BuildContext context) {
        return new Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.white,
        title: TextField(
                  decoration: InputDecoration(
                      hintText: 'Pesquise',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                      iconSize: 30.0)),
              onChanged: (val) {
                setState(() {
                  searchAddr = val;
                });
              },
            ),      ),
      body: Stack(
        children: [Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(-9.66583, -35.73528), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
          ),
        ),
         Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: movetoRioDeJaneio,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green
              ),
              child: Icon(Icons.forward, color: Colors.white),
            ),
          ),
        ),
         Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: movetoAlagoasMaceio,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red
              ),
              child: Icon(Icons.backspace, color: Colors.white),
            ),
          ),
        )
        ]
      ),
    );
  }
  
   void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
  movetoRioDeJaneio(){
     _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-22.9035, -43.2096), zoom: 14.0, bearing: 45.0, tilt: 45.0),
    ));
  }
   movetoAlagoasMaceio() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-9.66583, -35.73528), zoom: 12.0),
    ));
  }
}

