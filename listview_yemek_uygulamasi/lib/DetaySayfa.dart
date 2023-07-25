import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Yemekler.dart';

class DetaySayfa extends StatefulWidget {
  Yemekler yemek;
  DetaySayfa({required this.yemek});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.yemek.yemek_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Image.asset("resimler/${widget.yemek.yemek_resim_adi}"),
             Text("${widget.yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 20,color: Colors.blue),),
             SizedBox(
               width: 200,
               height: 50,
               child: ElevatedButton(
                   onPressed: (){
                 print("${widget.yemek.yemek_adi} Sipariş Verildi");

               }, child: Text("SİPARİŞ VER"),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.orange,
                   foregroundColor: Colors.white,
                 ),
               ),
             ),

           ],
            
        ),
      ),

    );
  }
}
