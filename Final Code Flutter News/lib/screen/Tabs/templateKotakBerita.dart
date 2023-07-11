import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projek1/data/data.dart';
import 'package:projek1/screen/artikel_page.dart';
import 'package:provider/provider.dart';

import '../../provider/darkmode.dart';

class templateKotakBerita extends StatefulWidget {
  final Artikel artikel;
  const templateKotakBerita({super.key, required this.artikel});

  @override
  State<templateKotakBerita> createState() => _templateKotakBerita3State();
}

class _templateKotakBerita3State extends State<templateKotakBerita> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => artikel_page(artikel: widget.artikel)));
      },
      child: Consumer<DarkThemeProvider>(builder: (context, themeProvider, _) {
        return Container(
          height: 110,
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              //color: Colors.white,
              border: Border.all(
                  color: themeProvider.darkTheme == false
                      ? const Color.fromARGB(100, 0, 0, 0)
                      : Colors.grey)),
          child: Row(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      //topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/${widget.artikel.gambar}'))),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.artikel.judul,
                        maxLines: 2,
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Text(
                        widget.artikel.deskripsi,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
