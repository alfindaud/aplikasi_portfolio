import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplikasi_pertamaku/manga_screen.dart';
import 'package:aplikasi_pertamaku/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'identitas_lengkap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // animasi splash screen
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
          centerTitle: true,
          title: Text(
            'Home',
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  'Alfin Habsa Balubun',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: const Text(
                  'alfin.daud@gmail.com',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.jpg', // Pastikan gambar ini ada
                      fit: BoxFit.cover,
                      width: 90,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/picture-banda.jpg'), // Gambar ini juga harus ada
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text('Read Manga'),
                onTap: () {
                  // page transition
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.scale,
                          alignment: Alignment.bottomCenter,
                          childCurrent: this,
                          duration: const Duration(milliseconds: 400),
                          // reverseDuration: const Duration(milliseconds: 400),
                          child: const MangaScreen()));
                },
              ),
              ListTile(
                // font awesome icon
                leading: const Icon(FontAwesomeIcons.whatsapp),
                title: const Text('WhatsApp'),
                onTap: () async {
                  final Uri url = Uri.parse(
                      'https://wa.me/6281294348808?text=Hello anda berbicara dengan alfin! ada yang bisa dibantu ??');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.instagram),
                title: const Text('Instagram'),
                onTap: () async {
                  final Uri url =
                      Uri.parse('https://www.instagram.com/alfin_daud/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.facebook),
                title: const Text('Facebook'),
                onTap: () async {
                  final Uri url =
                      Uri.parse('https://web.facebook.com/alfin.daud.7/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                              child: const Text('Batal'),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          TextButton(
                              child: const Text(
                                'Keluar',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                SystemNavigator.pop();
                              }),
                        ]),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.green,
                Colors.red,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AnimatedLogo(),
                const SizedBox(height: 25),
                Text(
                  'Alfin Habsa Balubun',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mobile Application Engineer / Web Development',
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        "Hello My name is Alfin. I am a student studying web and mobile application development. I am very interested in the world of technology, especially how applications and websites can help make everyday life easier.",
                        speed: const Duration(milliseconds: 40),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                  ),
                ),
                const SizedBox(height: 1),
                TextButton(
                  onPressed: () {
                    // Navigasi ke halaman IdentitasLengkapPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IdentitasLengkapPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Selengkapnya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// animated logo new class
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              // Menambahkan border tipis agar terlihat lebih bagus
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/logo.jpg',
                width: 150,
                height: 150, // Menambahkan height agar gambar tetap persegi
              ),
            ),
          ),
        ),
      ),
    );
  }
}
