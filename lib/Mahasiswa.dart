class Mahasiswa {
  int id;
  String _nama;
  String _jurusan;
  Mahasiswa(this._nama, this._jurusan);

  Mahasiswa.map(dynamic obj) {
    this._nama = obj['nama'];
    this._jurusan = obj['jurusan'];
  }
  String get nama => _nama;
  String get jurusan => _jurusan;

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map['nama'] = _nama;
    map['jurusan'] = _jurusan;

    return map;
  }

  void mahasiswaID(int id){
    this.id = id;
  }
}
