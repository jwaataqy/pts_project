import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pts_project/cart.dart';

class detail extends StatefulWidget {
  final String image;
  final String judul;
  final int harga;

  detail({
    required this.image,
    required this.judul,
    required this.harga,
  });
  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  bool isLiked = false;
  bool isGreen = false;
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final image = widget.image;
    final judul = widget.judul;
    final harga = widget.harga;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          title: Center(
              child: Text(
            'Detail produk',
            style: GoogleFonts.inter(color: Color(0xff292D32)),
          )),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Iconsax.arrow_left,
              color: Color(0xff292D32),
            ),
          ),
          actions: [_like()],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _banner(image, context),
                  _header(judul),
                  _rating(),
                  SizedBox(
                    height: 17,
                  ),
                  _desk(),
                  _pilihUkuran(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _ukuran(1, '39'),
                          SizedBox(
                            width: 20,
                          ),
                          _ukuran(2, '40'),
                          SizedBox(
                            width: 20,
                          ),
                          _ukuran(3, '41'),
                          SizedBox(
                            width: 20,
                          ),
                          _ukuran(5, '42'),
                          SizedBox(
                            width: 20,
                          ),
                          _ukuran(6, '43')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'Rp',
                                  decimalDigits: 0)
                              .format(harga)
                              .toString(),
                          style: GoogleFonts.inter(
                              color: Color(0xff292D32),
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 180,
                          height: 47,
                          decoration: BoxDecoration(
                              color: Color(0xff00B14F),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return cart();
                                },
                              ));
                            },
                            child: Text(
                              'Tambah keranjang',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  GestureDetector _ukuran(int index, String namaUk) {
    return GestureDetector(
      onTap: () => {
        setState(() => {selectedIndex = index})
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedIndex == index
                    ? Color.fromARGB(255, 30, 218, 114)
                    : Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: selectedIndex == index
                ? Color.fromARGB(60, 61, 219, 132)
                : Colors.transparent),
        // color: isGreen ? Colors.green : Colors.transparent,
        child: Center(
          child: Text(
            namaUk,
            style: GoogleFonts.inter(
                color: selectedIndex == index
                    ? Color.fromARGB(255, 30, 218, 114)
                    : Color.fromARGB(221, 158, 158, 158)),
          ),
        ),
      ),
    );
  }

  GestureDetector _like() {
    return GestureDetector(
      onTap: () => {
        setState(() => {isLiked = !isLiked})
      },
      child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Icon(
            Iconsax.heart5,
            color: isLiked ? Colors.red : Colors.black,
          )),
    );
  }

  Container _pilihUkuran() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        'Pilih Ukuran',
        style: GoogleFonts.inter(
            color: Color(0xff292D32),
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Container _desk() {
    return Container(
        // padding: EdgeInsets.symmetric(horizontal: 60),
        child: RichText(
            text: TextSpan(
                text:
                    'Our Made US 992 mens sneaker has heritage styling, premium materials and comfort features to elevate your off-duty look. These mens fashion sneakers have a pigskin...',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
          TextSpan(
              text: 'Baca selengkapnya',
              style: TextStyle(
                color: Colors.green,
              ))
        ])));
  }

  Container _rating() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '4.8',
            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '(102) | 67 ulasan',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromARGB(123, 41, 45, 50)),
          )
        ],
      ),
    );
  }

  Container _header(String judul) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          judul,
          style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w500),
        ));
  }

  Center _banner(String image, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
          width: screenWidth,
          height: 382,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
