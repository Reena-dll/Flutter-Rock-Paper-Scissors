import 'package:flutter/material.dart';
import 'dart:math';

// BURASI BİZİM OYUN SAYFAMIZ

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}
class _GamePageState extends State<GamePage> {
bool durum1 = true; // Taş için bool değişkeni. Gizleneceğinden dolayı kullanıldı.
bool durum2 = true; // Kağıt için bool değişkeni. Bir seçenek seçildiğinde diğerleri gizlenecek.
bool durum3 = true; // Makas için bool değişkeni.
int resimKK = Random().nextInt(3)+1; // Bu da bizim bilgisayarımızın yapmış olacağı taş-kağıt-makas tercihi
String resimYazi = ''; // PC'mizin seçeceği seçeneğe göre altına gelecek yazı. 'TAŞ'-'KAĞIT'-'MAKAS'
bool durum4 = false; // Bu pc'mizin seçtiği seçenek. Hem resim olarak hem yazı olarak Visibility içerisinde. Eğer true olduğunda karşımıza çıkacak.
bool durum5 = false; // Kazandı yazısının durumu.
bool durum6 = false; // Berabere yazısının durumu.
bool durum7 = false; // Kaybetti yazısının durumu
bool durum8 = true; // Sayfanın ilk açılışında hoş geldiniz yazısının durumu
bool durum9 = true; // 'Rakibiniz Bilgisayar.' yazının durumu.
  Text bitisYazi(String text, Color renk){ // Bu classta BERABERE,KAZANDINIZ,KAYBETTİNİZ yazılarının classları ve parametreleri
    // Renk ve text parametlerini tutuyoruz.
    return Text(
      '$text',style: TextStyle(// text parametresini yazının içinde kullanıyoruz.
        fontSize: 40.0, // Yazı boyutu
        fontWeight: FontWeight.bold, // Yazı kalınlığı
        color: renk, // Yazı rengi
    ),
    );
  }
  Text yazikontrol(String text){ // Oyun sayfasında ki bitiş yazıları dışında ki tüm yazılar buradan geliyor.
    return Text(

      '$text',style: TextStyle( // Stilleri ve yazısı.
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    ),
    );
  }
  Expanded butonKontrol(int resim, String text) { // Burası bizim kullanıcımızın seçin yapacağı TAŞ KAĞIT MAKAS Butonları.
    // 2 Adet parametre var. Birisi resmin adı( resimlerin adı 1-2-3 olduğu için int değişkende tuttum = resim )
    // Diğer parametre ise resimlerin altında olacak olan yazı. Onu da String text değişkeninde tuttum.
   return Expanded(
      child: FlatButton( // Flatbutton kullandım.
          onPressed: (){
            setState(() {
              print('$text tıklandı.'); // Burada konsola tıklandığında yazı düştüm.

              if(resimKK==1) // Bilgisayarımızın seçim yaptığı resim eğer 1 ise yani taş oluyoruz, onun alt tarafına yazısını getirdik.
              {
                resimYazi='Taş'; // resimyazıyı burada kallanarak pc'mizin seçim yapmış olduğu yazıyı gösterdik.
              }
              else if (resimKK==2) // Randomdan gelecek değer 2 ise Kağıt oluyor ve yazısı kağıt oluyor.
              {
                resimYazi='Kağıt';
              }
              else if (resimKK==3) // Randomdan gelecek değer 3 ise pc'mizin seçeneği makas oluyor.
                {
                  resimYazi='Makas';
                }

              if(resim==1) // Eğer kullanıcımız resim 1'i yani, Taşı seçerse diğer resim ve butonlar kaybolacak.
                {
                  durum2=false; // Burada bool değişkenlerini false'ye almamın sebebi Visibility onları yok etmek.
                  durum3=false;

                }
              else if(resim==2) // Kullanıcımız kağıtı seçer ise Taş ve Makas buttonlarının kaybolmasına yarayan kod. Yukarıda ki ile aynı
                  {
                    durum1=false; // Diğerlerini kaybettiğim kısım.
                    durum3= false;

                  }
              else if (resim==3) // Kullanıcı makası seçtiğinde olacak komutlar.
                {
                  durum1 = false; // Taş ve kağıtı yok ediyoruz.
                  durum2 = false;
                }
              durum4 = true; // Bu da pc mizin yapmış olduğu seçim. Kullanıcımız butona tıkladığı anda bizim PC'nin seçimi de ekrana geliyor.
              // Yani ekranda sadece bizim seçimimiz ve de pc nin yapmış olduğu seçim kalıyor.
              durum8 = false; // GamePage sayfasının ilk açılışında gelen yazıları false değeri ile kapatıyoruz.
              durum9 = false; // GamePage sayfasının ilk açılışında gelen yazıları false değeri ile kapatıyoruz.

              if(resimKK==resim) // EĞER PC NİN SEÇİMİ İLE KULLANICI SEÇİMİ AYNI İSE
                {
                  durum6 = true; // BERABERE yazısını true'ya seçerek görüntüleyebiliyoruz.
                // Yani daha öncesinde yazı görünmeyen yerde berabere yazacak.
                }

              // Burada taş kağıt makas oyununun mantıksal ifadeleri yer almaktadır.
              // Olasıkla alakalı bir kaç durum var onları if else mantığı ile yaptım.
              // Kısaca bahsetmek gerekirse;
              // Eğer pc nin seçtiği taş ve kullanıcının seçtiği kağıt ise ne olsun gibisinden sorgular var
              // Hepsinin durumuna göre yazdım ve sonuçlarını girdim.
              else if (resimKK!=resim && resimKK==1 && resim==2)
                {
                 durum5 = true;
                }
              else if (resimKK!=resim && resimKK==1 && resim==3)
                {
                  durum7= true;
                }
              else if (resimKK!=resim && resimKK==2 && resim==1)
                {
                  durum7 = true;
                }
              else if (resimKK!=resim && resimKK==2 && resim==3)
                {
                  durum5 =true;
                }
              else if (resimKK!=resim && resimKK==3 && resim==1)
                {
                  durum5 = true;
                }
              else if (resimKK!=resim && resimKK==3 && resim==2)
                {
                  durum7=true;
                }

            });
          },
          child: Column( // Buttonun içinde oluşturduğum kolon. Bunun sebebi hem fotoğrafı hem de yazıyı yazabilmek.
            children: <Widget>[
              Image.asset('images/$resim.png', width: 100.0,height: 100.0),// Fotomuzu burada parametre ile oluşturuyoruz.
              yazikontrol('$text') // Yazımızı da yine yazikontrol classı ile parametreli bir şekilde yazdırıyoruz.
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug etiketi kapatıldı.
      home: Scaffold(
        backgroundColor: Colors.lightBlue, // Arka plan rengi verildi
        body: Center( // Kolon body kısmında ortalandı
          child: Column( // Kolon açıldı
            mainAxisAlignment: MainAxisAlignment.center, // Kolonun içeriği ortalandı
            children: <Widget>[
              Visibility( // Bu komut sayesinde bir öğeyi gizleyip, gizliliğini açabiliyorum.
                  visible: durum8, // Gizlilik durumu açık mı kapalı mı
                  child: yazikontrol('Rakibiniz Bilgisayar.')//Burada gizlenecek olan child'in yazikontrol'dan geldiğini görüyoruz.
                // İlk durum da true olan değerler butonlara tıklandığında yok olacak.
              ),
              Visibility( // Yukarıda ki gibi ilk açıldığında gelen yazıların Visible durumu true iken
                // Buttonlara tıklandığında false değeri aldığında gizlenecek.
                  visible: durum9,
                  child: yazikontrol('Seçiminizi Yapınız.') // Bu yazılar yukarıda ki class sayesinde geliyor ve sayfa ilk açıldığında görünüyorlar.
              ),
              Padding(
                padding: EdgeInsets.only(top: 130.0), // Yazılar ile butonlar arasına attığım boşluk
              ),
              Visibility( // Bu bilgisayarımızın seçtiği seçenek. Randomdan gelecek olan değer ne ise ona göre taş kağıt makas gelecek.
                  visible: durum4, // İlk durumu görünmez, butona tıklandığında aktif olacak.
                  child: Column( // Kolon kullanmamın sebebi ise hem yazı hem de fotoğraf kullanmış olmam,
                    //Visibility komple kolonu gizleyip, gizliğiğini açabiliyor.
                    children: <Widget>[
                      Image.asset('images/$resimKK.png',width: 100.0,height: 100.0), // Fotoğrafı ekrana bastığım komut.
                      yazikontrol('$resimYazi') // Yazıyı yine class ve parametreler halinde hallettim.Parametre de pc'nin alacağı random değere göre değişiyor
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 25.0),// Kullanıcının seçeceği buttonlar ile pc'nin seçmiş olduğu resim arasına 25 piksel boşluk atıldı.
              ),
              Row( // Kullanıcıya seçim yapmak için Satır açtım ve satırın içerisine 3 tane button attım. Taş, kağıt, makas
                mainAxisAlignment: MainAxisAlignment.center, // Ortaladım bunları
                children: <Widget>[
                  Visibility( // Burada gizliliği kullanmamın sebebi ise, her hangi birisne tıklandığında diğerlerini gizlemek içindir.
                    visible: durum1, // Durum1 başta true, görünür.
                      child: butonKontrol(1,'Taş')//Yukarıda ki Expanded metodundan türettiğim class. 1. resmi alıp, altına Taş yazdıracak.
                  ),
                  Visibility(
                    visible: durum2,
                      child: butonKontrol(2, 'Kağıt') // Parametrelere göre ekranıma gelen butonlar.
                  ),
                  Visibility(
                      visible: durum3,
                      child: butonKontrol(3, 'Makas') //  Kullanıcı bunlardan birisini seçtiği taktirde, Diğer görünen butonlar kaybolacak.
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0), // Butonlar ile bitiş yazıları arasına 50 piksel boşluk attım.
              ),
              Visibility( // Bu kısımda ise başta görünürlüğü false olan bitiş yazılarımız mevcut.
                  visible: durum5,
                  child: bitisYazi('KAZANDINIZ', Colors.lightGreen)// Yukarıda ki classtan kullandım ve textini rengini belirledim.
              ),
              Visibility(
                  visible: durum6,
                  child: bitisYazi('BERABERE', Colors.deepOrangeAccent)),
              Visibility(
                  visible: durum7,
                  child: bitisYazi('KAYBETTİNİZ', Colors.red))
            ],
          ),
        ),
      ),
    );
  }
}
