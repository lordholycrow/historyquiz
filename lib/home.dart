import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarihlen/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "images/flagpic1.png",
    "images/flagpic2.png",
    "images/flagpic3.png",
    "images/flagpic4.jpg",
    "images/flagpic5.png",
  ];

  List<String> des = [
    "Osmanlı İmparatorluğu veya Osmanlı Devleti Oğuz Türklerinden Osman Gazi'nin kurduğu Osmanoğlu Hanedanı'nın hükümranlığında varlığını sürdürmüş çok uluslu Sünni Müslüman devlet.",
    "Roma İmparatorluğu, Roma Cumhuriyeti döneminde Augustus'un Cumhuriyeti tek başına yönetebilecek yetkiler alması ve Cumhuriyet döneminde kimseye verilmemiş haklara sahip olmasıyla oluşan Antik Roma devletidir.",
    "Moğol İmparatorluğu, 1206-1294 yılları arası Orta Asya'da kurulmuş eski bir imparatorluk.",
    "Rus İmparatorluğu veya Çarlık Rusyası, 1721 yılında kurulup 1917'deki Rus Devrimi'ne kadar var olmuş imparatorluktur.",
    "Britanya İmparatorluğu, Birleşik Krallık veya öncül devletleri tarafından yönetilen dominyonlar, sömürgeler, himayeler ve mandalar ile diğer bağımlı bölgelerden oluşmuş olan imparatorluk.",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarihlen - Başlamak için bir İmparatorluk Seçiniz",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Osmanlı İmparatorluğu", images[0], des[0]),
          customcard("Roma İmparatorluğu", images[1], des[1]),
          customcard("Moğol İmparatorluğu", images[2], des[2]),
          customcard("Rus İmparatorluğu", images[3], des[3]),
          customcard("Britanya İmparatorluğu", images[4], des[4]),
        ],
      ),
    );
  }
}
