import 'package:flutter/material.dart';

class HintScreen extends StatelessWidget {
  const HintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Krusel Mail"),
      ),
      body: Center(
        child: SizedBox(
          width: 1024,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset('assets/globe.png'),

                // Hinweis
                Positioned(
                  top: 355,
                  left: 430,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HintScreen(),
                      ),
                    ),
                    child: Container(
                      width: 7,
                      height: 7,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
