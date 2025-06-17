import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobileappproject/appmain.dart';
import 'package:mobileappproject/loginpage.dart';

class HeadingPage extends StatelessWidget {
  HeadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.coffee_sharp),
                  Text(
                    'Kupa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09, left: 20, right: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width * 0.6,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                ),
                items: [
                  'assets/images/food2.jpg',
                  'assets/images/food5.jpg',
                  'assets/images/food6.jpg',
                  'assets/images/food7.jpg',
                  'assets/images/food10.jpg',
                  'assets/images/food12.jpg',
                  'assets/images/food13.jpg',
                ].map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.6,  // Adjust the width to make it a circle
                        height: MediaQuery.of(context).size.width * 0.6, // Same height to keep it circular
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Make the container circular
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All Your',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  Text(
                    'Favorites foods',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  Text(
                    'Order your favorite menu with easy,',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  Text(
                    'on-demand delivery',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height * 0.07),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[700]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => appMain()),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: MediaQuery.of(context).size.height * 0.01),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white54),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
