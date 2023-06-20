// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';



// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// void getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       _locationData = 'Location services are disabled.';
//       setState(() {});
//       return;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         _locationData = 'Location permissions are denied.';
//         setState(() {});
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       _locationData =
//           'Location permissions are permanently denied, we cannot request permissions.';
//       setState(() {});
//       return;
//     }

//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     setState(() {
//       _locationData =
//           'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
//     });
 
//   }
// class _LocationScreenState extends State<LocationScreen> {
//   String _locationData = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: getCurrentLocation,
//               child: Text('Get Current Location'),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               _locationData,
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  
// }

// // void main() {
// //   runApp(MaterialApp(
// //     home: LocationScreen(),
// //   ));
// // }
