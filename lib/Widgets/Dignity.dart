import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Screens/ServicesScreen.dart';

class Dignity extends StatefulWidget {
  const Dignity({super.key});

  @override
  State<Dignity> createState() => _DignityState();
}

class _DignityState extends State<Dignity> {
  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961388/img4_hagdrw.webp',
      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961403/img5_dv4dph.webp',
      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961414/img6_cqscjy.webp',
      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961421/img7_vg9dnh.webp',
    ];

    final List<Map<String, String>> slides = [
      {'caption': 'Carpool'},
      {'caption': 'Support'},
      {'caption': 'Church Serivce'},
      {'caption': 'Graveyard Deco'},
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(195, 0, 0, 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔴 Your original red container
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961409/img8_ynelq7.webp',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [Colors.white, Colors.amber, Colors.white],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: Text(
                        '-DIGNITY\n SERVICE',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(117, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'We are here to help people at one of the most difficult times in their lives.\n We do this with compassion, respect, openness and care.\n Serving the people in our local communities at one of the most\n difficult times in their lives remains at the heart of everything we do\n and we are committed to providing the highest standards of\n service and care.',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ServicesScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'More Services',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            // 🖼️ Slideshow of two images at a time
            Expanded(
              child: CarouselSlider.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          imagePaths[index],
                          fit: BoxFit.fitHeight, // Adjust as needed
                          width: double.infinity,
                          height: 500,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 130),
                          child: Text(
                            slides[index]['caption']!,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 70, 70, 70),
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: 500,
                  viewportFraction: 0.5, // Show two images side-by-side
                  autoPlay: true,
                  enlargeCenterPage: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
