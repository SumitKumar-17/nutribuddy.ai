import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/models/vaccine.dart';



class VaccineDetailsScreen extends StatefulWidget {
  final Vaccine vaccine;
  final Function(Vaccine) onVaccineUpdated;

  VaccineDetailsScreen({
    required this.vaccine,
    required this.onVaccineUpdated,
  });

  @override
  _VaccineDetailsScreenState createState() => _VaccineDetailsScreenState();
}

class _VaccineDetailsScreenState extends State<VaccineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue[100],
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.vaccine.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Time to be Taken: ${widget.vaccine.timeToBeTaken}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'Age: ${widget.vaccine.age}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 6.0),

                  Text(
                    'Side-Effects: ${widget.vaccine.sideeffects}', // Assuming 'sideeffects' is a property of Vaccine
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Taken',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Checkbox(
                        value: widget.vaccine.taken,
                        onChanged: (value) {
                          setState(() {
                            widget.vaccine.taken = value ?? false;
                          });
                          widget.onVaccineUpdated(widget.vaccine); // Notify the main screen about the change
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.vaccine.taken = !widget.vaccine.taken;
                });
                widget.onVaccineUpdated(widget.vaccine); // Update the main list as well
              },
              style: ElevatedButton.styleFrom(
                primary: widget.vaccine.taken ? Colors.red : Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  widget.vaccine.taken ? 'Mark as Not Taken' : 'Mark as Taken',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
