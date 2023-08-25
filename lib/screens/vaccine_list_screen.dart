import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/models/vaccine.dart';
import 'package:nutribuddy.ai/screens/vaccine_details_screen.dart';

class VaccineListScreen extends StatefulWidget {
  @override
  _VaccineListScreenState createState() => _VaccineListScreenState();
}

class _VaccineListScreenState extends State<VaccineListScreen> {
  List<Vaccine> vaccines = [

  Vaccine(
  name: "Varicella",
  diseaseprevented:"Chickenpox",
  age: "15 months",
  timeToBeTaken: " Age less than 13 years: one dose, Age more than 13 years: 2 doses at 4-8 weeks interval",
  sideeffects: " Fever, Rash, Soreness, Swelling, Fatigue ",
  ),
  Vaccine(
  name: "OPV",
  diseaseprevented:"Poliomyelitis",
  age: "birth ",
  timeToBeTaken: "6 doses with interval of 6 weeks,10 weeks,14 weeks,15-18 months,5 years respectively",
  sideeffects: " Fever, Diarrhea, Vomiting, Rash, Fatigue ",
  ),
  Vaccine(
  name: "BCG",
  diseaseprevented:"Tuberculosis",
  age: "birth or till 1 year of age",
  timeToBeTaken: "2 doses with an interval of atleast 4 weeks",
  sideeffects: " Swelling, Redness, Drainage, Ulceration, Fever ",
  ),
  Vaccine(
  name: "HEPATITIS B",
  diseaseprevented:"Hepatitis B(affecting liver)",
  age: "birth",
  timeToBeTaken: "3 doses with an interval of atleast 4 weeks",
  sideeffects: " Pain, Redness, Swelling, Fever, Fatigue ",
  ),
  Vaccine(
  name: "PENTAVALENT",
  diseaseprevented:"Diphtheria,Pertussis,Tetanus,pneumonia,meningitis,Hepatitis B",
  age: "birth",
  timeToBeTaken: "3 doses with an interval of atleast 4 weeks",
  sideeffects: " Fever, Irritability, Swelling, Pain, Redness ",
  ),
  Vaccine(
  name: "ROTAVIRUS",
  diseaseprevented:"Diphtheria,Pertussis,Tetanus,pneumonia,meningitis,Hepatitis B",
  age: "birth",
  timeToBeTaken: "3 doses with an interval of atleast 4 weeks",
  sideeffects: "Fever, Diarrhea, Vomiting, Irritability, Fatigue ",
  ),
  Vaccine(
  name: "FIPV",
  diseaseprevented:"Poliomyelitis",
  age: "6 weeks",
  timeToBeTaken: "2 doses with an interval of 8 weeks ",
  sideeffects: " Fever, Sneezing, Nasal discharge, Vomiting, Diarrhea ",
  ),
  Vaccine(
  name: "MEASLES RUBELLA",
  diseaseprevented:"Measles and Rubella",
  age: "9 months",
  timeToBeTaken: "2 doses with an interval of 8 months ",
  sideeffects: " Fever, Rash, Pain, Swelling, Headache ",
  ),
  Vaccine(
  name: "DPT",
  diseaseprevented:"Diphtheria,Pertussis,Tetanus",
  age: "2 years",
  timeToBeTaken: "2 doses with an interval of 4 years ",
  sideeffects: " Fever, Irritability, Swelling, Pain, Drowsiness",
  ),
  Vaccine(
  name: "TD",
  diseaseprevented:"Tetanus and Diphtheria",
  age: "10 years",
  timeToBeTaken: "2 doses with an interval of 6 years ",
  sideeffects: "Pain, Swelling, Redness, Fever, Fatigue",
  ),
  Vaccine(
  name: "PCV",
  diseaseprevented:"Pneumococcal Pneumonia",
  age: "6 weeks",
  timeToBeTaken: "3 doses with an interval of 8 weeks and 22 weeks respectively ",
  sideeffects: "Fever, Redness, Swelling, Irritability, Loss of appetite",
  ),
  Vaccine(
  name: "JE",
  diseaseprevented:"Brain Fever",
  age: "1 year",
  timeToBeTaken: "2 doses with an interval of 1 year ",
  sideeffects: "Pain, Redness, Fever, Headache, Fatigue",
  ),



  // Add more vaccines here
  ];

  int get takenVaccinesCount => vaccines.where((vaccine) => vaccine.taken).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Checklist'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'vaccine_icon.jpeg',
                        width:60,
                        height:60,
                  )
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    "Getting vaccinated is crucial to prevent the "
                        "spread of diseases and protect yourself and "
                        "those around you. Vaccines help your immune"
                        " system build defenses against harmful viruses "
                        "and bacteria.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vaccines.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VaccineDetailsScreen(
                          vaccine: vaccines[index],
                          onVaccineUpdated: (vaccine) {
                            setState(() {
                              vaccines[index] = vaccine;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),

                      title: Text(
                        vaccines[index].diseaseprevented,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        vaccines[index].taken ? Icons.check_circle : Icons.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}