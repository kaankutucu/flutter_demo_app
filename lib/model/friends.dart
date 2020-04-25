import '../image_asset.dart';

class Friend { //image asset klasöründen çekilen verileeri burada döndürmek için oluşturulmuş class sınıfıdır.
  final String name;
  final String imagePath;
  final bool isOnline;
// 3 adet değişken tanımlıyoruz ve bunları friend değişkenine atıyoruz
  const Friend({this.name, this.imagePath, this.isOnline});
}

final friends = [
  Friend(name: "Jennie", imagePath: friend_jeenie, isOnline: true),
  Friend(name: "Gena", imagePath: friend_gena, isOnline: false),
  Friend(name: "Michelle", imagePath: friend_michelle, isOnline: false),
  Friend(name: "Trish", imagePath: friend_trish, isOnline: false),
];
//böylece isimleri klasörden dinamik olarak getirmiş oluyoruz.