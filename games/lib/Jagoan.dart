import 'Senjata.dart';
import 'Jubah.dart';

class Jagoan {
  late String nama;
  late int kesehatanDasar = 100;
  late int kekuatanDasar = 100;
  late int derajat = 1;
  late int totalKerusakan = 0;
  late int kenaikanKesehatan = 10;
  late int kenaikanKekuatan = 10;
  late bool hidup = true;

  Jubah? jubah;
  Senjata? senjata;

  Jagoan(this.nama);

  int sehatMaksimal() {
    return kesehatanDasar +
        (jubah != null ? jubah!.getTambahKesehatan() : 0) +
        derajat * kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return kekuatanDasar +
        (senjata != null ? senjata!.getKekuatanSerang() : 0) +
        derajat * kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return sehatMaksimal() - totalKerusakan;
  }

  void naikDerajat() {
    derajat++;
  }

  bool getStatus() {
    return hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = getKekuatanSerangJagoan();
    print('$nama menyerang ${lawan.nama} dengan kekuatan $kerusakan');
    lawan.bertahan(kerusakan);
    naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = jubah != null ? jubah!.getNilaiKekuatan() : 0;
    int selisihKerusakan;

    print('$nama memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan');

    totalKerusakan += selisihKerusakan;

    if (getNilaiKesehatan() <= 0) {
      hidup = false;
      totalKerusakan = sehatMaksimal();
    }

    info();
  }

  void info() {
    print('Jagoan: $nama');
    print('Derajat: $derajat');
    print('Kesehatan Dasar: $kesehatanDasar');
    print('Kekuatan Dasar: $kekuatanDasar');
    print('Kesehatan: ${this.getNilaiKesehatan()}/${this.sehatMaksimal()}');
    print('Kekuatan Maksimal: ${getKekuatanSerangJagoan()}');
    print('Masih hidup?: $hidup');
    if (jubah != null) print('Jubah: ${jubah!.getNama()}');
    if (senjata != null) print('Senjata: ${senjata!.getNama()}');
    print('');
  }
}
