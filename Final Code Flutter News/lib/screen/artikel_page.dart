import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data.dart';
import '../provider/darkmode.dart';

class artikel_page extends StatefulWidget {
  final Artikel artikel;
  const artikel_page({super.key, required this.artikel});

  @override
  State<artikel_page> createState() => _artikel_pageState();
}

class _artikel_pageState extends State<artikel_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/images/logo.png",
            width: 80,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            )),
        actions: [
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/${widget.artikel.gambar}',
                //width: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.artikel.judul,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/${widget.artikel.gambarAuthor}',
                    width: 25,
                  ),
                  Text(
                    " - ${widget.artikel.waktu}",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.artikel.deskripsi),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Topik Terkait : "),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Consumer<DarkThemeProvider>(
                      builder: (context, themeProvider, _) {
                    return Container(
                      child: Row(children: [
                        for (String topikArtikel in widget.artikel.topik)
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: themeProvider.darkTheme == false
                                          ? const Color.fromARGB(100, 0, 0, 0)
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(" ${topikArtikel}"))
                      ]),
                    );
                  })),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
