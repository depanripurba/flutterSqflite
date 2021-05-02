import 'package:appsqflite/DBHelper.dart';
import 'package:appsqflite/Mahasiswa.dart';
import 'package:appsqflite/Tampildata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi dengan sqflite",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  Homepagechild createState() => Homepagechild();
}

class Homepagechild extends State<HomePage> {
  var db = new DBHelper();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add, color: Colors.white),
          onPressed: (){
            return Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex)=> new HalamanInput()));
          },
          ),
          
      appBar: new AppBar(
        title: new Text("Flutter + Sqflite"),
      ),
      body: FutureBuilder(
        future: db.getMhs(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          var data = snapshot.data;

          if(snapshot.hasData){
            return new Tampildata(data);
            
          }else{
            return new Center(
              child: new Text("Data belum ada, harap tambah data dengan menekan tombol tambah dibawah. Pesan ini langsung dari developer android Depanri Purba"),
            );
          }
        },
      )
    );
  }
}


class HalamanInput extends StatefulWidget{
  @override
  HalamanInputchild createState()=>HalamanInputchild();
}
// Pembuatan kelas untuk halaman input data
class HalamanInputchild extends State<HalamanInput>{
  final cnama = TextEditingController();
  final cjurusan = TextEditingController();
  Future addMahasiswa()async{
    var db = DBHelper();
    var mhs = Mahasiswa(cnama.text,cjurusan.text);
    await db.simpanData(mhs);
    print("data berhasil di simmpan");
  }
  
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Halaman input data"),

      ),
  body: new Center(
    child: new Column(children: <Widget>[
      new Container(
        margin: EdgeInsets.all(10.0),
        child: new TextFormField(
          controller: cnama,
          decoration: new InputDecoration(
            icon: new Icon(Icons.person),
            hintText: 'Nama',
            labelText: 'Nama'
          ),
        ),
      ),
      new Container(
        margin: EdgeInsets.all(10.0),
        child: new TextFormField(
          controller: cjurusan,
          decoration: new InputDecoration(
            icon: new Icon(Icons.person),
            hintText: 'Jurusan',
            labelText: 'Jurusan'
          ),
        ),
      ),
      new Container(
        child: new FloatingActionButton(
          child: new Icon(Icons.save),
          onPressed:(){
            addMahasiswa();
          }
,        ),
        ),

      

    ],),
  ),
    );
  }
}