import 'Senjata.dart';
import 'Jubah.dart';
import 'Jagoan.dart';


void main() {
  Jagoan pitung = Jagoan('Pitung');
  Jubah jubahSilatPutih = Jubah('Jubah Silat Putih', 7, 50);
  Senjata golok = Senjata('Golok', 20);

  pitung.jubah = jubahSilatPutih;
  pitung.senjata = golok;

  Jagoan jakaSembung = Jagoan('Jaka Sembung');
  Jubah jubahSilatHitam = Jubah('Jubah Silat Hitam', 10, 50);
  Senjata toya = Senjata('Toya', 25);

  jakaSembung.jubah = jubahSilatHitam;
  jakaSembung.senjata = toya;

  pitung.info();
  jakaSembung.info();

  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);
  jakaSembung.menyerang(pitung);

  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);
  pitung.menyerang(jakaSembung);

  print('${pitung.nama}: ${pitung.getNilaiKesehatan()}');
  print('${jakaSembung.nama}: ${jakaSembung.getNilaiKesehatan()}');

  if (pitung.getStatus() && !jakaSembung.getStatus()) {
    print('${pitung.nama} menang cuy!');
  } else if (!pitung.getStatus() && jakaSembung.getStatus()) {
    print('${jakaSembung.nama} menang cuy!');
  } else {
    if (pitung.getNilaiKesehatan() > jakaSembung.getNilaiKesehatan()) {
      print('${pitung.nama} menang cuy!');
    } else if (pitung.getNilaiKesehatan() < jakaSembung.getNilaiKesehatan()) {
      print('${jakaSembung.nama} menang cuy!');
    } else {
      print('Kedua jagoan seri, cuy!');
    }
  }
}