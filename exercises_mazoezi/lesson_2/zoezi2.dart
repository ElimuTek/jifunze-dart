import 'dart:io'; // Import (tumia) Library ya Input / Output ili kumwezesha user kutoa na kupokea 

void main() {
  // Orodha ya aina za fedha zinazopatikana
  // List ni mkusanyiko wa vitu. Hapa, ni list ya strings zinazowakilisha ainza za fedha za kigeni.
  List<String> sarafu = ['USD', 'NGN', 'ZAR', 'TZS', 'KES', 'EUR'];

  // Alama za Fedha za Kigeni
  // Map (ramani) ni kama kamusi, yaani ni mkusanyiko wa key-value pairs (jozi za ufunguo-thamani).
  // KEY (ufungo) husaidia kutafuta value yake (thamani), kama vile lazima ujue herufi za neno ili kutafuta maana yake kwenye kamusi.
  // Hapa tunaunganisha aina ya sarafu na alama zake.
  Map<String, String> alamaZaSarafu = {
    'USD': '\$',
    'NGN': '\u20A6', // Alama ya Naira ya Nigeria kama rune ya Unicode
    'ZAR': 'R',
    'TZS': 'TSh',
    'KES': 'KSh',
    'EUR': '\u20AC' // Alama ya Euro kama rune ya Unicode
  };

  // Map (ramani au kamusi) ya viwango vya ubadilishaji wa fedha za kigeni kulingana na ya USD $1 (mf Dola 1 ni shillingi 2550 za kiTanzania)
  // Map hii inatumia String kama ufunguo (mf "TZS") na double kama thamani (kiwango cha ubadilishaji).
  Map<String, double> viwangoVyaUbadilishaji = {
    'USD': 1.0,
    'NGN': 1595.50, // Naira ya Nigeria
    'ZAR': 18.80,   // Randi ya Afrika Kusini
    'TZS': 2550.00, // Shilingi ya Tanzania
    'KES': 143.00,  // Shilingi ya Kenya
    'EUR': 0.92     // Euro
  };

  // Kuomba user (mtumiaji wa program) anaanzia na fedha ya aina gani
  print("Ingiza msimbo wa herufi tatu wa sarafu unayotaka kubadilisha kutoka:");
  printSarafu(sarafu, alamaZaSarafu);
  String? sarafuChanzo = stdin.readLineSync()!.toUpperCase();

  // Kuhakiki sarafu ya kuanzia
  // Njia ya 'contains' inaangalia kama list inajumuisha kipengele kilichotolewa.
  if (!sarafu.contains(sarafuChanzo)) {
    print("Chaguo la sarafu si sahihi. Programu inaacha kufanya kazi.");
    return; // Inaondoka kwenye function kuu
  }

  // Kuomba mtumiaji atoe kiasi cha kubadilisha
  print("Ingiza kiasi cha $sarafuChanzo (${alamaZaSarafu[sarafuChanzo]}) unachotaka kubadilisha:");
  String? kiingilioChaKiasi = stdin.readLineSync();
  double kiasiChaKubadilisha;

  // Kudhibiti hitilafu na try-catch
  try {
    kiasiChaKubadilisha = double.parse(kiingilioChaKiasi!); // Inabadilisha string kuwa double
  } catch (e) {
    print("Kiasi kisicho sahihi. Programu inaacha kufanya kazi.");
    return;
  }
  
  // Kuomba mtumiaji atoe sarafu lengwa
  print("Ingiza msimbo wa herufi tatu wa sarafu unayotaka kubadilisha kwenda:");
  printSarafu(sarafu, alamaZaSarafu);
  String? sarafuLengwa = stdin.readLineSync()!.toUpperCase();

  // Kuhakiki sarafu lengwa
  if (!sarafu.contains(sarafuLengwa)) {
    print("Chaguo la sarafu si sahihi. Programu inaacha kufanya kazi.");
    return;
  }

  // Mantiki ya ubadilishaji
  // Function convertCurrency inafafanuliwa hapo chini.
  double kiasiKilichobadilishwa = badilishaSarafu(kiasiChaKubadilisha, sarafuChanzo, sarafuLengwa, viwangoVyaUbadilishaji);

  // Kuonyesha kiasi kilichobadilishwa
  print("Kiasi Kilichobadilishwa: ${kiasiKilichobadilishwa.toStringAsFixed(2)} ${alamaZaSarafu[sarafuLengwa]}");
}

// Function hii inachapisha orodha ya sarafu pamoja na alama zake.
void printSarafu(List<String> sarafu, Map<String, String> alama) {
  for (String sarafuMoja in sarafu) {
    print("$sarafuMoja (${alama[sarafuMoja]}) - Ingiza '$sarafuMoja'");
  }
}

// Function ya kubadilisha sarafu
double badilishaSarafu(double kiasi, String chanzo, String lengwa, Map<String, double> viwango) {
  double kiasiKatikaMsingi = kiasi / viwango[chanzo]!; // Inabadilisha kuwa sarafu ya msingi (USD)
  return kiasiKatikaMsingi * viwango[lengwa]!; // Inabadilisha kuwa sarafu lengwa
}
