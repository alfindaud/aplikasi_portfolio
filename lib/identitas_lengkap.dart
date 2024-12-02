import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'myskill.dart';

class IdentitasLengkapPage extends StatelessWidget {
  const IdentitasLengkapPage({super.key});

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
          "Identitas Lengkap",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: AnimatedLogo(),
                ),
                const SizedBox(height: 25),
                Text(
                  'Alfin Daud',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const FadeIn(
                        duration: Duration(seconds: 2),
                        child: Text(
                          "Saat ini, saya sedang fokus mempelajari:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const FadeIn(
                        duration: Duration(seconds: 2),
                        child: Text(
                          "• Web Development: Menggunakan teknologi seperti HTML, CSS, JavaScript, dan framework modern seperti React atau Bootstrap.",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const FadeIn(
                        duration: Duration(seconds: 2),
                        child: Text(
                          "• Mobile App Development: Menggunakan Flutter untuk membuat aplikasi lintas platform dengan desain yang responsif dan fungsional.",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const FadeIn(
                        duration: Duration(seconds: 2),
                        child: Text(
                          "Tujuan saya adalah menjadi seorang developer yang tidak hanya ahli secara teknis, tetapi juga mampu menciptakan aplikasi dan situs web yang inovatif dan memberikan dampak positif bagi penggunanya.",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .end, // Posisi tombol di sebelah kanan
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MySkillPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue, // Warna background tombol
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              'Lihat Skill Saya',
                              style: TextStyle(
                                color: Colors.white, // Warna teks tombol
                                fontWeight:
                                    FontWeight.bold, // Ketebalan teks tombol
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

// FadeIn animasi untuk animasi teks fade-in
class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeIn({
    super.key,
    required this.child,
    required this.duration,
  });

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// AnimatedLogo widget
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
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
