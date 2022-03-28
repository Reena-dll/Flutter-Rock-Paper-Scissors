import 'package:flutter/material.dart';
import 'package:taskagitmakas/LandingPage.dart';
// diğer sayfaya ulaşmak için import edildi.
// MAİN DOSYAM, SADECE DİĞER SAYFAYA AKTARMA YAPILMAK İÇİN KULLANILDI.
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false, // DEBUG ETİKETİ KALDIRMA KOMUTU
    home: LandingPage(), // Home' kısmına diğer sayfayı çağırıyor.
     )
   );
}