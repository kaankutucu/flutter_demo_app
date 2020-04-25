import 'package:flutter/material.dart';
import 'package:google_stadia_app_concept/image_asset.dart';
import 'package:google_stadia_app_concept/model/last_played_game.dart';


class SecondaryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;  //sayfa yüksekliği hangi telefonda açılırsa o telefona otomatik olarak konum alması için yazılmıştır

    return Scaffold( // uygulamamızın iskeletini oluşturuyoruz yazılan bütün kodlar bu class içerisine yazılmıştır
      body: Column( // body verdiğimiz widget ile görsellerin yatat hizalanmasını sağlıyoruz
        children: <Widget>[
          Expanded( // bu komut ile tanımalana imagenin telefon ekranına sığdırılmasını sağladık
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(  //daha önce class olarak tanımladığımızı görseli asset olarak çekip homeda gösterilmesini sağlıyoruz
                  game_sekiro,
                  height: 400,   // resime yüksklik ve genişlik verip kutuyu tam doldurmasını sağlıyoruz
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5), // backgrounda opicty vererek resmi şeffaf gösterilmesini sağlıyoruz
                ),
                Column(
                  children: <Widget>[
                    SizedBox(     // appar ile searchbar iconu arasındaki boşluğu ayarlıyoruz
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16), //margin symetrik vererek tam ortaya hizalanmasını sağlıyoruz
                      decoration: BoxDecoration(  // bu class kutu oluşturmak için verilen kod bloğudur
                        border: Border.all(color: Colors.white, width: 1),  // boc kenarlık verip renk veriyoruz
                        borderRadius: BorderRadius.all(Radius.circular(4)), // radius ile kenarlıkları oval hale getiriyoruz
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12), //boc içi padding verdiğimiz için box içerisinde hizalanmasını sağlıyoruz
                            child: InkWell(
                              child: Icon(Icons.menu, color: Colors.white), //appbardaki hamburger menüyü oluşturmak için verilen koddur
                              onTap: () {}, //tıklanma fonksioynunu boş bırakıyoruz
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: InkWell(
                             child:Icon(Icons.search,color: Colors.white,),  // appbardaki search iconu için verilen kod bloğudur.
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(), // flexte satırların arasındaki boşluğu ayarlamak için verilen kod
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0), // background image ortasındaki yazıyı ayarlamak için verilen kod
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // center verip columda tam ortaya gelmesini sağlıyoruz
                        children: <Widget>[
                          RichText(  //birden fazla text classı oluşturmak istediğimiz için verdik
                            textAlign: TextAlign.center, // text hizalanmasını yapmamız için verilen kod
                            text: TextSpan(
                              children: [
                                TextSpan(  // oluşturulan yazıda boyut renk ve kalınlık için verilen kod.
                                  text: "Nish Game",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(text: '\n'),
                                TextSpan(  // oluşturulan yazıda boyut renk ve kalınlık için verilen kod.
                                  text: "Yeni Deneyimler İçin",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),  // button ayarlaması için verilen kod
                              decoration: BoxDecoration( // oluşturulan boxta renk ve kenar keskinliği için verilen kod
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                              ),

                              child: Text(   // button içerisindeki texti ayarlamak için verilen kod
                                "İzle",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded( //flex yapıyı bodyde genişletmek için verilen kod
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(  //padding oluşturup verdiğimiz text columda hazialanmasını sağlamak için verilen kod
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ContentHeadingWidget(heading: "Arkadaşlarının popüler oyunları"),// en altta tanımladığımızı widgeti burada dinamik olarak gelmesini sağladık class ile
                ),
                Expanded(
                  child: SingleChildScrollView(   // en altta oluşturulan widget ile dnamik olarak popüler oyunların gelmesini sağlayan kod bloğu
                    scrollDirection: Axis.horizontal,  // yatayda kaydırılma yapılması için kullanılan kod
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < popularWithFriends.length; i++)
                          PopularWithFriendsWidget(   //en altta oluşturulan widget ile for döngüsüyle girilen oyun kadar ekrana gösterilmesini sağlayan kod bloğu
                            imagePath: popularWithFriends[i],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded( // flex yapıyı genişletmek için verilen kod
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ContentHeadingWidget(heading: "Ferhat Şuan Oynuyor"),  //oluşturulan widget dinamik olarak gelmesisi sağlayan kod
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: screenHeight * 0.20,  // yüksekliğe ekran yüksekliğinin %25 olarak verdik
                      decoration: BoxDecoration(  //
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Stack( //iç içe rownların üst üste gösterilmesini sağlamak için oluşturulan kod
                            children: <Widget>[
                              ClipRRect( //dikdörtgen kullanarak image özellişetirmek için kullanılan kod
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(  // fotorğraf classında oluşturulan clasın 0. indisini getireir
                                  lastPlayedGames[0].imagePath,
                                  height: screenHeight * 0.13,  // yükselik scrrenheigth göre verilmiştir
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(  // buttonu konumladırmak için verilen kod bloğu
                                left: 25,
                                right: 25,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(  // button arka planını vermek için oluşturulan kod bloğu
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(  // en alttaki buttonu oluşturmak için verilen kodlar
                                    Icons.play_arrow,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: RichText(  // text için verilen kodlar
                              text: TextSpan(  // birden fazla child textleri gösterebilmek için verimiştrir.
                                children: [
                                  TextSpan(text: "Knight Online", style:
                                  TextStyle(fontSize: 14, color: Colors.grey.shade900, fontWeight: FontWeight.bold,).//textlerin styllerini vermek için yazılmıştır
                                  copyWith(color: Colors.white, fontSize: 16),),
                                  TextSpan(text: '\n'),
                                  TextSpan(text: "10 saat oynadi", style:
                                  TextStyle(fontSize: 14, color: Colors.grey.shade600,).
                                  copyWith(color: Colors.white, fontSize: 16, height: 1.5),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(  //en alttaki navigationbarları oluşturmak için verilen kod bloğu
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blueAccent, // buttonların renklerini ayarlamak için verilen kod bloğu
        items: [
          BottomNavigationBarItem(
              title: Text("Anasayfa"), icon: Icon(Icons.home)), // button sınıflarını oluşturmak için verilen kod
          BottomNavigationBarItem(
              title: Text("Oyunlar"), icon: Icon(Icons.gamepad)),// button sınıflarını oluşturmak için verilen kod
          BottomNavigationBarItem(
              title: Text("Gelen Kutum"), icon: Icon(Icons.videogame_asset)),// button sınıflarını oluşturmak için verilen kod
          BottomNavigationBarItem(
              title: Text("Kütüphane"), icon: Icon(Icons.laptop_chromebook)),// button sınıflarını oluşturmak için verilen kod
        ]),
    );
  }
}




class ContentHeadingWidget extends StatelessWidget {

  final String heading;

  const ContentHeadingWidget({Key key, @required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {   //ferhat şuan oynuyor ver arkadaşlarının oyunları adlı rowların stillerini oluşturmak için verilen kod bloğu
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),  // sayfa içi boşluk veriilmiştir
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 20,  //yazı yüksekliğiverilmiştir
          color: Colors.black, // yazı rengi verilmiştir
          fontWeight: FontWeight.bold, // yazı kalınlığı verilmiştir
        ),
      ),
    );
  }
}

class PopularWithFriendsWidget extends StatelessWidget {
  final String imagePath;

  const PopularWithFriendsWidget({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {   // for döngüsüne sokulacak görseller iççin verilen still kodları
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), //row içi boşluk için verilen kod ayarıdır
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)), child: Image.asset(imagePath)),  // image kenarlıklarını ayarlamak için verilen kod
          ),
          Positioned(         // iconların pozisyon olarak ayarlarnmasını sağlamak için kullanılır
            bottom: 10,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


