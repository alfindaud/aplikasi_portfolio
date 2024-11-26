import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySkillPage extends StatelessWidget {
  const MySkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Skill Saya",
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Keterampilan Saya",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  skillCard(
                    "Web Development",
                    "Menguasai HTML, CSS, JavaScript, dan framework seperti Laravel dan Bootstrap.",
                  ),
                  skillCard(
                    "Flutter Development",
                    "Membuat aplikasi portfolio sederhana menggunakan framwork Flutter.",
                  ),
                  skillCard(
                    "Backend Development",
                    "Pengalaman menggunakan PHP, dan database seperti MYSQL.",
                  ),
                  skillCard(
                    "UI/UX Design",
                    "Mendesain antarmuka yang menarik dan user-friendly menggunakan Figma.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu keterampilan
  Widget skillCard(String title, String description) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
