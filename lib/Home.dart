import 'dart:html';
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pts_project/cart.dart';
import 'package:pts_project/detail.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int _selectedIndex = 0; // Indeks item yang dipilih

  // Daftar warna yang sesuai dengan item yang dipilih atau tidak dipilih
  List<Color> itemColors = [
    Color(0xff00B14F),
    Colors.black87,
    Colors.black87,
    Colors.black87
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color(0xffFFFFFF),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Container(
              height: 45,
              width: 350,
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.only(left: 20, bottom: 5),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                style: GoogleFonts.openSans(color: Colors.black54),
                decoration: InputDecoration(
                  hintText: 'Cari pakaian Pria',
                  hintStyle: GoogleFonts.openSans(
                      color: Color.fromARGB(121, 41, 45, 50)),
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: Icon(
                      Iconsax.search_normal_1,
                      size: 24,
                      color: Color(0xff292D32),
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  Icon(
                    Iconsax.notification,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return cart();
                      },));
                    },
                    child: Icon(
                      Iconsax.bag,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            _banner(),
            SizedBox(height: 24),
            _category(),
            SizedBox(
              height: 18,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _categoryList(0, 'Semua'),
                  _categoryList(1, 'Kemeja'),
                  _categoryList(2, 'sepatu'),
                  _categoryList(3, 'Aksesoris'),
                  _categoryList(4, 'celana'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _barang(context, 'assets/batikpria.png',
                                'Batik pria lengan \npanjang', 199900),
                            _barang(context, 'assets/newbalance.png',
                                'new balance 992 \n grey original', 1240000),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _barang(context, 'assets/jeans.png',
                                'Skinny Jeans Dark\n Blue Wanita', 379900),
                            _barang(
                                context,
                                'assets/kacamata.png',
                                'Kacamata Baca \n Anti Radiasi Blue Ray',
                                125000),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _barang(
                                context,
                                'assets/kemejapolos.png',
                                'Kemeja Pria Polos \nLengan Pendek Oxford',
                                119000),
                            _barang(context, 'assets/hoodie.png',
                                'Human Greatness \nHoodie Hitam', 229000)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _BtmNav());
  }

  GestureDetector _barang(
    BuildContext context,
    String img,
    String nameBarang,
    int hargaBarang,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return detail(image: img, judul: nameBarang, harga: hargaBarang);
          },
        ))
      },
      child: Container(
        width: screenWidth / 2.4,
        height: 264,
        // margin: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(img),
            SizedBox(
              height: 6,
            ),
            Text(
              nameBarang,
              style: GoogleFonts.inter(
                  color: Color(0xff292D32),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              NumberFormat.currency(
                      locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
                  .format(hargaBarang)
                  .toString(),
              style: GoogleFonts.inter(
                  color: Color(0xff292D32),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Container _categoryList(int index, String name) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Row(children: [
        GestureDetector(
          onTap: () => {
            setState(() {
              selectedIndex = index;
            })
          },
          child: Container(
            height: 43,
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Color(0xff00B14F) // Warna latar belakang saat aktif
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 43,
                  width: 101,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedIndex == index
                          ? Colors.transparent
                          : Color(0xffF2F2F7),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Color(0xffb1b2b2),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Container _category() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Kategori',
            style: GoogleFonts.inter(
                color: Color(0xff292D32),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Lihat semua',
            style: GoogleFonts.inter(
                color: Color(0xff00B14F),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Container _banner() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Image.asset(
          'assets/banner.png',
          fit: BoxFit.cover,
        ));
  }

  BottomNavigationBar _BtmNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: itemColors[_selectedIndex],
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.heart),
          label: 'Favorit',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.task_square),
          label: 'Transaksi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.user),
          label: 'Profil',
        ),
      ],
      unselectedItemColor: Colors.black87,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Mengubah warna item yang dipilih menjadi warna yang diinginkan
      for (int i = 0; i < itemColors.length; i++) {
        itemColors[i] = i == index ? Color(0xff00B14F) : Colors.black87;
      }
    });
  }
}
