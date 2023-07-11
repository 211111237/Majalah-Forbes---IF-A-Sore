import 'package:flutter/material.dart';
import 'package:projek1/screen/artikel_page.dart';
import '../../data/data.dart';

class templateKotakBerita2 extends StatefulWidget {
  final Artikel artikel;
  const templateKotakBerita2({super.key, required this.artikel});

  @override
  State<templateKotakBerita2> createState() => _templateKotakBerita2State();
}

class _templateKotakBerita2State extends State<templateKotakBerita2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => artikel_page(artikel: widget.artikel)));
      },
      child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${widget.artikel.gambar}"))),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 18,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(2),
                          bottomRight: Radius.circular(2)),
                      color: Color.fromARGB(120, 0, 0, 0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.artikel.judul,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Regular')),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
