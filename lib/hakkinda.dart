import 'package:flutter/material.dart';
import 'package:yapilacaklar/main.dart';

class hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hakkında',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
            title: Text('Hakkında')
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir Çınar tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173004004 numaralı Sefa AKKURT tarafından 30 Nisan 2021 gününde yapılmıştır. '),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => App()),);
                  },
                    child: Text('Anasayfaya Dön'),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}