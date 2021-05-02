import 'package:appsqflite/Mahasiswa.dart';
import 'package:flutter/material.dart';

class Tampildata extends StatefulWidget {
  final List<Mahasiswa> data;
  Tampildata(this.data, {Key key});
  _Tampildata createState() => _Tampildata();
}

class _Tampildata extends State<Tampildata> {
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 1
                    : 1),
                    itemCount: widget.data.length==null?0:widget.data.length,
                    itemBuilder: (BuildContext context, int i){
                      return new Card(
                        child:Column(
                          children: <Widget>[
                            new Text(widget.data[i].nama),
                            new Text(widget.data[i].jurusan)
                          ],
                        ) ,);
                    },
                    );
  }
}
