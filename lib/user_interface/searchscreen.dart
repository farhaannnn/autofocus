import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  List<String> vehicles = [
    'Tata	Nano Genx',
    'Datsun	Redi-Go',
    'Renault	Kwid',
    'Maruti Suzuki	Alto K10',
    'Datsun	Go',
    'Maruti Suzuki	Celerio',
    'Hyundai	Santro',
    'Tata	Tiago',
    'Maruti Suzuki	Ignis',
    'Renault	Triber',
    'Toyota	Etios Liva',
    'Tata	Bolt',
    'Hyundai	Xcent',
    'Kia Sonet',
    'Maruti Suzuki	Dzire ',
    'Hyundai	Elite I20',
    'Hyundai	Aura',
    'Hyundai i20',
    'Volkswagen	Polo',
    'Volkswagen Virtus',
    'Volkswagen Taigun',
    'Toyota Innova',
    'Chevrolet Cruze',
    'Chevrolet Beat',
    'Maruti Suzuki Ritz',
    'Volkswagen	Ameo',
    'Ford	Aspire',
    'Toyota	Etios Cross',
    'Mahindra	Verito Vibe',
    'Fiat	Urban Cross',
    'Toyota	Glanza',
    'Fiat	Avventura',
    'Honda	Jazz',
    'Mahindra	Bolero Power Plus',
    'Maruti Suzuki	Vitara Brezza',
    'Ford	Ecosport',
    'Renault	Duster',
    'Hyundai	Verna',
    'Mahindra	Xuv300',
    'Volkswagen	Vento',
    'Tata	Tigor Ev',
    'Honda	Brv',
    'Mahindra	Thar',
    'Maruti Suzuki	Xl6',
    'Fiat	Abarth Avventura',
    'Mahindra	Tuv300 Plus',
    'Mahindra	Marazzo',
    'Mahindra	Scorpio',
    'Skoda	Monte Carlo',
    'Mahindra	Xuv500',
    'Mahindra	E Verito',
    'Tata	Hexa',
    'Toyota	Innova Crysta',
    'Jeep	Compass',
    'Toyota	Corolla Altis',
    'Honda	Civic',
    'Kia	Carnival',
    'Skoda	Superb',
    'Mitsubishi	Outlander',
    'Volvo	V40',
    'Mercedes-Benz A-Class',
    'Toyota	Fortuner',
    'Mitsubishi	Pajero Sport',
    'Ford	Endeavour',
    'Volvo	V40 Cross Country',
    'Mini	Cooper 3 Door',
    '	Mercedes-Benz Gla-Class',
    ' Skoda	Kodiaq Scout',
    'Toyota	Camry',
    'Volvo	S60',
    'Mercedes-Benz C-Class',
    'Bmw	3-Series',
    'Honda	Accord Hybrid',
    'Volvo	S60 Cross Country',
    'Toyota	Prius',
    'Audi	Q5',
    'Mercedes-Benz Glc',
    'Lexus	Es',
    '	Mercedes-Benz E-Class',
    'Bmw	5-Series',
    'Lexus	Nx 300H',
    'Audi	A5',
    'Jaguar	F-Pace',
    'Bmw	6-Series',
    'Volvo	V90 Cross Country',
    'Mitsubishi	Montero',
    'Audi	A5 Cabriolet',
    'Porsche	Macan',
    'Volvo Xc90',
    'Jaguar Xj',
    'Bmw X7',
    'Porsche Cayenne',
    'Porsche Cayenne Coupe',
    'Maserati Ghibli',
    'Bmw M4',
    'Toyota Land Cruiser',
    'Bmw M5',
    'Porsche	Panamera',
    'Audi	R8',
    'Lamborghini	Urus',
    'Bentley	Continental Gt',
    'Ferrari	Portofino',
    'Bentley	Bentayga',
    'Aston Martin	Db 11',
    'Maruti Suzuki	Alto',
    'Maruti Suzuki	S-Presso',
    'Maruti Suzuki	Celerio',
    'Hyundai	Grand I10 Prime',
    'Mahindra	Kuv100 Nxt',
    'Maruti Suzuki	Swift',
    'Tata	Altroz',
    'Rolls-Royce Cullinan',
    'Rolls-Royce Phantom Coupe',
    'Tata	Tigor',
    'Tata	Zest',
    'Honda	Amaze',
    'Maruti Suzuki	Gypsy',
    'Hyundai	Venue',
    'Tata	Nexon',
    'Fiat	Linea',
    'Maruti Suzuki	Ertiga',
    'Maruti Suzuki	Baleno ',
    'Tata	Safari Storme',
    'Mg	Hector',
    'Tata	Nexon Ev',
    'Hyundai	Elantra',
    'Hyundai	Tucson',
    'Volkswagen	Passat',
    'Isuzu	Mu-X',
    'Volkswagen	Tiguan',
    'Skoda	Superb Sportline',
    '	Mercedes-Benz B-Class',
    'Skoda	Kodiaq',
    'Audi	Q3',
    'Jeep	Wrangler',
    'Bmw	Z4 Roadster',
    'Audi	Q7',
    'Audi	S5',
    'Ford	Mustang',
    'Mercedes-Benz E-Class Cabriolet',
    'Porsche	718',
    'Toyota	Land Cruiser Prado',
    'Lamborghini	Huracan',
    'Ferrari	488 Gtb',
    'Maruti Suzuki	Omni',
    'Fiat	Punto Evo Pure',
    'Ford	Figo',
    'Maruti Suzuki	Baleno',
    'Hyundai	Grand I10',
    'Fiat	Linea Classic',
    'Nissan	Sunny',
    'Mahindra	Bolero',
    'Maruti Suzuki	Ciaz',
    'Skoda	Rapid',
    'Fiat	Abarth Punto',
    'Hyundai	Creta',
    'Tata	Harrier',
    'Isuzu	Dmax V-Cross',
    'Jeep	Compass Trailhawk',
    'Honda	Cr-V',
    'Hyundai	Grand I10 Nios',
    'Hyundai	Xcent',
    'Nissan	Micra',
    'Mahindra	Nuvosport',
    'Nissan	Kicks',
    'Tata	Winger',
    'Hyundai	Kona Electric',
    'Audi	A3',
    'Volvo	Xc40',
    'Bmw	X3',
    'Mercedes-Benz V-Class',
    'Bmw	M2 Competition',
    'Nissan	Gtr',
    'Aston Martin	Rapide',
    'Maruti Suzuki R	Wagon',
    'Tata	Tiago Nrg',
    'Toyota	Yaris',
    'Skoda	Octavia',
    'Dc	Avanti',
    'Bmw	X4',
    'Lexus	Rx 450H',
    'Aston Martin	Vantage',
    'Fiat	Punto Evo',
    'Honda	City',
    'Honda	Wr-V',
    'Mahindra	Tuv300',
    'Maruti Suzuki	S-Cross',
    'Renault	Captur',
    'Mahindra	Xylo',
    'Kia	Seltos',
    'Nissan	Terrano',
  ];
  List<String> filteredVehicles = [];
  TextEditingController searchController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    filteredVehicles.addAll(vehicles);
  }

  void filterVehicles(String searchQuery) {
    searchQuery = searchQuery.toLowerCase();
    setState(() {
      filteredVehicles = vehicles
          .where((vehicle) => vehicle.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  vehicledetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update(({'cars': FieldValue.arrayUnion([searchController.text])}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Select car',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
              onPressed: () {
                vehicledetails();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.green,
                    content: Text(
                      'Vehicle added successfully',
                      style: GoogleFonts.raleway(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )));
                Navigator.pop(context);
              },
              child:  Text('Add',style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,color: Colors.white),))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18)),
              child: TextField(
                
                         
                controller: searchController,
                onChanged: (value) => filterVehicles(value),
                decoration: const InputDecoration(
                  // border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(20)),
                  //         ),
                  labelText: 'Search',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              
              child: ListView.separated(
                 separatorBuilder: (context, index) {
    return const Divider(thickness: 0.3,color: Colors.white,);
                 },
                itemCount: filteredVehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = filteredVehicles[index];
                  return ListTile(
                    title: Text(vehicle,style: GoogleFonts.raleway(color: Colors.white),),
                    onTap: () => setState(() {

                      searchController.text = vehicle;
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
