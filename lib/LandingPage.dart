import 'package:flutter/material.dart';
import 'package:taskagitmakas/GamePage.dart';

// Açılış SAYFASI,
// Oyun hakkında bilgi verilen ekran.
// Ekrana basılıp geçiliyor.

class LandingPage extends StatelessWidget {

  Text Textim (String yazi){ //Class'ım da bir adet STring parametre bulunmakta.
    // Aşağıda kullanacağım Text metotları için yazı özelliklerini burada tuttum. Sebebi ise kod tekrarından kaçmak.
    return Text(
        '$yazi', // Parametreyi Text kısmında kullanıyorum.
        style: TextStyle(  // Yazı stilleri
            fontWeight: FontWeight.bold, // Yazı kalınlığı
            fontSize: 20.0 // Yazı boyutu.
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug etiketi kapatma.
      home: Scaffold(
        backgroundColor: Colors.lightBlue, // Arka plan renk ayarı.
        appBar: AppBar( // AppBar kodu
          centerTitle: true, // AppBar'ın başlık yazısı ortalama komutu.
          title: Text( // AppBar Başlık
            'Taş - Kağıt - Makas',style: TextStyle( // AppBar başlık yazısı ve stilleri.
            fontSize: 25.0, // Boyut
            fontWeight: FontWeight.bold // Kalınlık
          ),
          ),
        ),
        body: InkWell( // Button için kullanıldı.
          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  GamePage())),
          //Body'de ınkwell olduğu için ekranın her hangi bir yerine tıklandığı halinde diğer sayfaya geçiş sağlanacaktır!.
          // Burada oluşturduğumuz butonda, Navigator sayesinde sayfalar arası geçiş yapıyoruz.
          child: Center( // Kolonu ortalamak için Center kullanıldı.
            child: Column( // Kolon açma komutu
              mainAxisAlignment: MainAxisAlignment.center, // Kolon içerisini ortalamak için kullanıldı.
              children: <Widget>[ // Kolon içerisinde widget kullanabilmek için children Widget kullandım.
                Textim('Oyunumuza Hoş Geldiniz.'), // Kolon içerisinde yukarıda ki class sayesinde yazı yazdım.
                Padding( // Hoş Geldiniz yazısı ile Altta ki yazıların arasına 10 piksel boşluk attım.
                  padding: EdgeInsets.only(top: 10.0), // Padding'i araya boşluk atmak için kullandım.
                ),
                Textim('Kağıt Taşı Sarar.'), // Yukarıda ki classı kullanıp parametre doldurdum. Yazı yazdırdım
                Textim('Makas Kağıdı Keser.'),
                Textim('Taş Makası Ezer.'),
                Padding(
                  padding: EdgeInsets.only(top:10.0 ), // Üstte ki yazılar ile altta ki yazı arasına yine boşluk için Padding kullandım
                ),
                Textim('Başlamak İçin Tıklayınız.'), // Class kullanarak yazı yazdırdım.
                Padding(
                  padding: EdgeInsets.only(top: 100), // Yazılar ile aşağıda ki Row arasına 100 piksel boşluk attım.
                ),
                Row( // Satır açma komutu !
                  mainAxisAlignment: MainAxisAlignment.center, // Satır içerisini ortalama komutu
                  children: <Widget>[
                    Expanded
                      (child: Image.asset('images/1.png', width: 100.0, height: 100.0,) // Dosyamda olan image'leri ekrana bastırma komutu
                    ),
                    Expanded
                      (child: Image.asset('images/2.png', width: 100.0, height: 100.0,) // Burada yükseklik ve genişlik metotlarını kullandım.
                    ),
                    Expanded
                      (child: Image.asset('images/3.png', width: 100.0, height: 100.0,) // Hepsi eş değer büyüklükte.
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
