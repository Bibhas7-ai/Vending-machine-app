import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  // Data placeholders for NodeMCU, Ultrasonic sensor, and RFID tap count
  String nodeMCUData = "Data from NodeMCU";
  String ultrasonicData = "Data from Ultrasonic sensor";
  int rfidTapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanitary Pad Vending Machine'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap for a Sanitary Pad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Display data from NodeMCU for Sanitary Pad 1
                // You can replace this with the actual data retrieval logic
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Node MCU Data'),
                      content: Text('Pad count = 10'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Node MCU Data'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Display data from Ultrasonic sensor for Sanitary Pad 2
                // You can replace this with the actual data retrieval logic
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Ultrasonic Sensor Data'),
                      content: Text('Product Available'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Ultrasonic Sensor Data'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Display RFID tap count for Sanitary Pad 3
                // You can replace this with the actual data retrieval logic
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('RFID Count'),
                      content: Text('RFID Tap Count: 40'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('RFID Count'),
            ),
            // Add more buttons for additional sanitary pads as needed
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the login page
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400] ?? Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
