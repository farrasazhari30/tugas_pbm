class Senjata {
  late String nama;
  late int kekuatan;

  Senjata(this.nama, this.kekuatan);

  String getNama() {
    return nama;
  }
  int getKekuatanSerang() {
    return kekuatan * 2;
  }
}
