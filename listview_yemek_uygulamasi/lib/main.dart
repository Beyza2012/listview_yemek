import 'package:flutter/material.dart';
import 'package:listview_yemek_uygulamasi/DetaySayfa.dart';

import 'Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];
    var y1 = Yemekler(1, "Köfte", "kofte.png", 90.99);
    var y2 = Yemekler(1, "Makarna", "makarna.png", 85.99);
    var y3 = Yemekler(1, "Kadayıf", "kadayif.png", 90.99);
    var y4 = Yemekler(1, "Fanta", "fanta.png", 20.99);
    var y5 = Yemekler(1, "Baklava", "baklava.png", 80.99);
    var y6 = Yemekler(1, "Ayran", "ayran.png", 20.99);
    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);
    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
          var yemekListesi = snapshot.data;
          return ListView.builder(
            itemCount: yemekListesi?.length,
            itemBuilder: (context,indeks){
              var yemek = yemekListesi?[indeks];

              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(yemek: yemek)));
                },
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset("resimler/${yemek?.yemek_resim_adi}")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(yemek!.yemek_adi,style: TextStyle(fontSize: 25),),
                          SizedBox(height: 50,),
                          Text("${yemek?.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 20,color: Colors.blue),),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              );

            },

          );
          }else{
            return Center();
          }

        },
      ),

    );
  }
}
