import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class cart extends StatefulWidget {
  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int index_sepatu = 0;
  int index_kacamata = 0;
  int index_hoodie = 0;
  int harga_sepatu = 0;
  int harga_kacamata = 0;
  int harga_hoodie = 0;
  // List<String> price_kacamata = ['0', '450.000', '900.000'];
  // List<String> price_sepatu = ['0', '1.240.000', '2.480.000'];
  // List<String> price_hoodie = ['0', '165.900', '331.800'];
  int ongkir = 14000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        title: Center(
          child: Text(
            'Keranjang',
            style: GoogleFonts.inter(color: Color(0xff292D32)),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Iconsax.arrow_left,
            color: Color(0xff292D32),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Iconsax.more,
              color: Color(0xff292D32),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _location(),
          _sepatu(),
          SizedBox(
            height: 40,
          ),
          _kacamata(),
          SizedBox(
            height: 40,
          ),
          _hoodie(),
          SizedBox(
            height: 50,
          ),
          _harga(),
          Container(
            width: 381,
            height: 47,
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Color(0xff00B14F),borderRadius: BorderRadius.circular(8)),
            child: TextButton(onPressed: () {}, child: Text('Tambahkan Keranjang',style: GoogleFonts.inter(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)))
        ],
      ),
    );
  }

  Container _harga() {
    return Container(
          width: 382,
          height: 150,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: GoogleFonts.inter(
                          color: Color.fromARGB(164, 41, 45, 50),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                        '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(harga_hoodie + harga_kacamata + harga_sepatu)}',style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ongkir',style: GoogleFonts.inter(
                          color: Color.fromARGB(164, 41, 45, 50),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),),
                    Text(
                        '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(ongkir)}',style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),)
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: GoogleFonts.inter(
                          color: Color.fromARGB(164, 41, 45, 50),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),),
                    Text(
                        '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(harga_hoodie + harga_kacamata + harga_sepatu + ongkir)}',style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),)
                  ],
                ),
              ],
            ),
          ),
        );
  }

  Container _hoodie() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/hoodie.png',
                width: 100,
              ),
              _deskBarangHoodie(),
            ],
          ),
          _barangHoodie()
        ],
      ),
    );
  }

  Container _kacamata() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/kacamata.png',
                width: 100,
              ),
              _deskBarangKacamata(),
            ],
          ),
          _barangKacamata()
        ],
      ),
    );
  }

  Container _sepatu() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/newbalance.png',
                width: 100,
              ),
              _deskBarangSepatu(),
            ],
          ),
          _barangSepatu(),
        ],
      ),
    );
  }

  Container _barangHoodie() {
    return Container(
      width: 92,
      height: 44,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF2F2F7)),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => {
                    if (index_hoodie > -1)
                      {
                        setState(() => {
                              index_hoodie = index_hoodie - 1,
                              harga_hoodie = harga_hoodie - 165900
                            })
                      }
                  },
              child: Icon(Iconsax.minus)),
          SizedBox(
            width: 10,
          ),
          Text(index_hoodie.toString()),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => {
              setState(
                () {
                  index_hoodie = index_hoodie + 1;
                  harga_hoodie = harga_hoodie + 165900;
                },
              )
            },
            child: Icon(
              Iconsax.add,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Container _deskBarangHoodie() {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Human Greatness ,,,',
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'XL, Hitam',
                style:
                    GoogleFonts.inter(color: Color.fromARGB(136, 41, 45, 50)),
              )),
          Text(
            '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(harga_hoodie)}',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container _barangKacamata() {
    return Container(
      width: 92,
      height: 44,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF2F2F7)),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => {
                    if (index_kacamata > -1)
                      {
                        setState(() => {
                              index_kacamata = index_kacamata - 1,
                              harga_kacamata = harga_kacamata - 450000
                            })
                      }
                  },
              child: Icon(Iconsax.minus)),
          SizedBox(
            width: 10,
          ),
          Text(index_kacamata.toString()),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => {
              setState(
                () {
                  index_kacamata = index_kacamata + 1;
                  harga_kacamata = harga_kacamata + 450000;
                },
              )
            },
            child: Icon(
              Iconsax.add,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Container _deskBarangKacamata() {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Kacamata Baca ...',
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '-2, Hitam',
                style:
                    GoogleFonts.inter(color: Color.fromARGB(136, 41, 45, 50)),
              )),
          Text(
            '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(harga_kacamata)}',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container _barangSepatu() {
    return Container(
      width: 92,
      height: 44,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF2F2F7)),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => {
                    if (index_sepatu > 0)
                      {
                        setState(() => {
                              index_sepatu = index_sepatu - 1,
                              harga_sepatu += 1240000
                            })
                      }
                  },
              child: Icon(Iconsax.minus)),
          SizedBox(
            width: 10,
          ),
          Text(index_sepatu.toString()),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => {
              setState(
                () {
                  index_sepatu = index_sepatu + 1;
                  harga_sepatu = harga_sepatu + 1240000;
                },
              )
            },
            child: Icon(
              Iconsax.add,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Container _deskBarangSepatu() {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'New Balance 992 ...',
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '40',
                style:
                    GoogleFonts.inter(color: Color.fromARGB(136, 41, 45, 50)),
              )),
          Text(
            '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(harga_sepatu)}',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Container _location() {
    return Container(
      width: 382,
      height: 106,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F7), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17, top: 20),
                child: Row(
                  children: [
                    Icon(Iconsax.location),
                    SizedBox(width: 8),
                    Text(
                      'Dikirim Ke',
                      style: GoogleFonts.inter(
                          color: Color.fromARGB(171, 41, 45, 50),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, top: 20),
                child: Text(
                  'Ubah',
                  style: GoogleFonts.inter(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 45, top: 8),
            child: Text(
              'Jakarta, Cibubur, Kota Wisata \nMadrid No 23',
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
