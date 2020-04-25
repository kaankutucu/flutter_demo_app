import 'package:flutter/material.dart';     //burada material sınıfı oluşturmak için import ettik
import 'pages/secondary_home_page.dart';    //açışış sayfamızın main ile iletişim halinde olması için yazmış olduğumuz kod bloğudur

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nish App',  // uygulamamızın başlık ismidir
      debugShowCheckedModeBanner: false,   //debug iconunun görülmesinii engellemek için kullanılan kod bloğu
      theme: ThemeData(canvasColor: Colors.white, primarySwatch: Colors.blue, fontFamily: 'Oxygen'), // açılış sayfamızın tema stylelleri için yazılmıştır
      home: SecondaryHomePage(), // uygulamam ilk açıldığında gösterilmesini istediğimiz sayfayı buraya tanımlıuoruz
    );
  }
}