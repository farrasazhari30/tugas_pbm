class Jubah {
  late String nama;
  late int kekuatan;
  late int kesehatan;

  Jubah(this.nama, this.kekuatan, this.kesehatan);

  String getNama() {
    return nama;
  }

  int getTambahKesehatan() {
    return kesehatan * 10;
  }

  int getNilaiKekuatan() {
    return kekuatan * 2;
  }
}