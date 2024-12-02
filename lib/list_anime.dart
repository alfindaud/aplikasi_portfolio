import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class ListAnimePage extends StatelessWidget {
  const ListAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background hitam
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'List Anime',
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 16.0, // Jarak antar card
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            animeCard(
              'assets/naruto2.png',
              'https://samehadaku.email/anime/naruto-shippuden/',
              'Naruto Shippuden',
            ),
            animeCard(
              'assets/one_piece.png',
              'https://samehadaku.email/anime/one-piece/',
              'One Piece',
            ),
            animeCard(
              'assets/bleach.png',
              'https://samehadaku.email/anime/bleach-sennen-kessen-hen/',
              'Bleach',
            ),
            animeCard(
              'assets/dragon.png',
              'https://samehadaku.email/anime/dragon-ball-super-movie-broly/',
              'Dragon Ball: Z',
            ),
            animeCard(
              'assets/re_zero.png',
              'https://samehadaku.email/anime/rezero-kara-hajimeru-isekai-seikatsu/',
              'Re:Zero',
            ),
            animeCard(
              'assets/jujutsu.png',
              'https://samehadaku.email/anime/jujutsu-kaisen/',
              'Jujutsu Kaisen',
            ),
            animeCard(
              'assets/kimetsu.png',
              'https://samehadaku.email/anime/kimetsu-no-yaiba/',
              'Kimetsu No Yaiba',
            ),
            animeCard(
              'assets/kaijuu.png',
              'https://samehadaku.email/?s=kaijuu',
              'Kaijuu 8-gou',
            ),
          ],
        ),
      ),
    );
  }

  Widget animeCard(String imageUrl, String link, String title) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(link);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            throw 'Tidak dapat membuka URL $link';
          }
        },
        child: SizedBox(
          height: 280, // Tinggi Card lebih besar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5, // Memperbesar proporsi gambar
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Colors.black, Colors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.star,
                        color: Colors.white, // Warna dasar bintang
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
