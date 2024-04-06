import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/get-location.dart';
import 'package:weather_app/weatherData.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEE,d MMM, yyyy').format(dayInfo);

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var client = WeatherData();
  List<String> suggestions = [];
  TextEditingController locationController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var data;
  double contentOpacity = 0.0;
  @override
  void initState() {
    super.initState();
    info();
  }

  info() async {
    var position = await GetPosition();
    data = await client.getData(position.latitude, position.longitude);
    setState(() {
      contentOpacity = 1.0;
    });

    return data;
  }

  // void fetchDataForLocation(String location) async {
  //   var response = await client.getDataForLocation(location);
  //   setState(() {
  //     data = response;
  //   });
  // }

  // void getSuggestions(String query) async {
  //   try {
  //     var newSuggestions = await client.getLocationSuggestions(query);
  //     setState(() {
  //       suggestions = newSuggestions;
  //     });
  //   } catch (e) {
  //     print('Error fetching suggestions: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.value(data),
          //future: info(),
          builder: ((context, snapshot) {
            // print("Snapshot: ${snapshot.connectionState}");
            if (data == null) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(90, 50, 50, 50),
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.amber, // Start Color (Bottom)
                  size: 90,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error fetching weather data"),
              );
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(height: height * 0.0),
                  Container(
                    height: height * 0.71,
                    width: width * 1.5,
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    margin: const EdgeInsets.only(right: 7, left: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 111, 229, 250),
                          Color.fromARGB(255, 55, 146, 250),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2, 0.9],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${data?.cityName}",
                          style: GoogleFonts.hubballi(
                            fontWeight: FontWeight.w600,
                            fontSize: 45,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          "${data?.region}",
                          style: GoogleFonts.hubballi(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          dateFormat,
                          style: GoogleFonts.mavenPro(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Image(
                          image: NetworkImage(
                            "https:${data?.icon}",
                          ),
                          width: width * 0.3,
                          fit: BoxFit.fill,
                        ),
                        // Image(
                        //   image: AssetImage(data?.customIconAsset ??
                        //       'assets/images/wind-direction.png'),
                        //   width: width * 0.3,
                        //   fit: BoxFit.fill,
                        // ),
                        Text(
                          "${data?.condition}",
                          style: GoogleFonts.hubballi(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${data?.temp.toInt()}°",
                          style: GoogleFonts.hubballi(
                            fontSize: 75,
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        "assets/images/wind.png"),
                                    width: width * 0.15,
                                  ),
                                  Text(
                                    "${data?.wind}km/h",
                                    style: GoogleFonts.hubballi(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "Wind",
                                  //   style: GoogleFonts.mavenPro(
                                  //       color: Colors.black,
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.bold),
                                  // )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        "assets/images/humidity.png"),
                                    width: width * 0.15,
                                  ),
                                  Text(
                                    "${data?.humidity}",
                                    style: GoogleFonts.hubballi(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "Humidity",
                                  //   style: GoogleFonts.mavenPro(
                                  //       color: Colors.black,
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.bold),
                                  // )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        "assets/images/north.png"),
                                    width: width * 0.15,
                                  ),
                                  Text(
                                    "${data?.wind_direction}",
                                    style: GoogleFonts.hubballi(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Text(
                                  //   "Wind Direction",
                                  //   style: GoogleFonts.mavenPro(
                                  //     color: Colors.black,
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Gust",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "${data?.gust}km/h",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Pressure",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "${data?.pressure}hpa",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "UV",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "${data?.uv}",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Preciptation",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "${data?.pricipe}mm",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Wind",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "${data?.wind}km/h",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Last Updated",
                              style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "${data?.last_update}",
                              style: GoogleFonts.mavenPro(
                                color: Colors.green,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }),
        ),
      ),
    );
  }
}
