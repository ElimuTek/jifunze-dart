import 'dart:io';
import 'dart:math';


// Zoezi la 1.1: Andika FUNCTION inayoitwa addTwo ambayo inapokea nambari mbili kama ARGUMENTS na ku RETURN jumla ya nambari hizo.
num addTwo(){
  try {
    // Hatua ya kwanza ni kutoa ujumbe kwa mtumiaji (USER) ili kuomba aingize nambari (INPUT).
    //    Ona '\n' huanzisha mstari mpya (line break)
    print("Karibu! Hebu tujaribu baadhi ya functions rahisi za dart.\nTujumlishe!\nIngiza nambari ya kwanza:");

    // Kusoma maandishi kutoka kwa mtiririko wa input wa mtumiaji na kuyahifadhi katika VARIABLE itakayoitwa num1.
    //    Hapa tunatumia 'stdin.readLineSync()' kusoma input kutoka kwa mtumiaji.
    //    Tunatumia 'num.parse' ili kubadilisha input hiyo kuwa nambari (input huanza kama string).
    num num1 = num.parse(stdin.readLineSync()!);

    // Kumwomba mtumiaji aingize nambari ya pili.
    print("Ingiza nambari ya pili (itakayojumlishwa na nambari ya kwanza hapo juu):");
    // Kusoma na kuhifadhi nambari ya pili kwa kutumia mtindo ule ule kama wa nambari ya kwanza. (Ona hapo juu.)
    num num2 = num.parse(stdin.readLineSync()!);

    // Kujumlisha nambari mbili zilizoingizwa na kuhifadhi jumla yake katika variable 'sum'.
    num sum = num1 + num2;

    // Ku RETURN jumla ya nambari mbili kama OUTPUT ya FUNCTION.
    return sum;
  } catch (e) {
    // Kutambua na kushughulikia makosa (ERROR HANDLING): Kama input haiwezi kubadilishwa kuwa nambari, programu itaruka hapa na kutuma onyo au ujumbe kwa mtumiaji.
    // Ujumbe wa hitilafu unaprintiwa na function inarudisha 0.
    print("HITILAFU Invalid Input: Inaonekana umeingiza kitu ambacho si nambari sahihi. Function imeshindwa na itarudisha 0. Ukitaka kujaribu tena, tafadhali anza upya.");
    return 0;
  }
}


// Zoezi la 1.2: Andika function inayoitwa subtractTwo ambayo inapokea nambari mbili kama arguments na kureturn tofauti ya nambari hizo (kutoa namba ya pili kutoka kwa namba ya kwanza).
num subtractTwo() {
  try {
    print("\n\nTutoe!\nIngiza nambari ya kwanza:");
    num num1 = num.parse(stdin.readLineSync()!);
    print("Ingiza nambari ya pili (itakayotolewa kutoka nambari ya kwanza hapo juu):");
    num num2 = num.parse(stdin.readLineSync()!);
    return num1 - num2;
  } catch (e) {
    print("HITILAFU Invalid Input: Nambari isiyo sahihi au kosa la input. Function itarudisha 0.");
    return 0;
  }
}

// Zoezi la 1.3: Kuandika function inayoitwa multiplyTwo ambayo inapokea nambari mbili kama arguments na kureturn product ya nambari hizo.
num multiplyTwo() {
  try {
    print("\n\nTuzidishe!\nIngiza nambari ya kwanza:");
    num num1 = num.parse(stdin.readLineSync()!);
    print("Ingiza nambari ya pili (itakayozidishwa na nambari ya kwanza hapo juu):");
    num num2 = num.parse(stdin.readLineSync()!);
    return num1 * num2;
  } catch (e) {
    print("HITILAFU Invalid Input: Nambari isiyo sahihi au kosa la input. Function itarudisha 0.");
    return 0;
  }
}

// Zoezi la 1.4: Kuandika function inayoitwa divideTwo ambayo inapokea nambari mbili kama arguments na kurejesha mgawanyo wa nambari hizo.
num divideTwo() {
  try {
    print("\n\nTugawanye!\nIngiza namba ya kwanza (dividend):");
    num num1 = num.parse(stdin.readLineSync()!);
    print("Ingiza nambari ya pili (divisor):");
    num num2 = num.parse(stdin.readLineSync()!);
    if (num2 == 0) throw Exception('Huwezi kugawanya kwa sifuri (Divide by zero error)');
    return num1 / num2;
  } catch (e) {
    print("HITILAFU Invalid Input: ${e}. Function itarudisha 0.");
    return 0;
  }
}

// Zoezi la 1.5: Kuandika function inayoitwa stringLength ambayo inapokea argument ya aina ya String na kurejesha urefu wa string hiyo.
int stringLength(){
  print("\n\nTuhesabu UREFU wa STRING (idadi ya herufi)\nIngiza string yoyote:");
  // Inasoma maandishi kutoka kwa mtiririko wa input ya kawaida na kuyahifadhi katika variable userString.
  String userString = (stdin.readLineSync()!);
  int stringLength = userString.length;
  return stringLength;
}

// Zoezi la 1.6: Kuandika function inayoitwa getFirstElement ambayo inapokea list kama argument na kurejesha element ya kwanza ya list hiyo.
dynamic getFirstElement(List<dynamic> list) {
  if (list.isNotEmpty) {
    return list.first; // Pia unaweza kutumia list[0]
  } else {
    throw Exception('List ni tupu');
  }
}

void main(){
  print("Jumla ni:\n${addTwo()}");
  print("Tofauti ni:\n${subtractTwo()}");
  print("Jumla ni:\n${multiplyTwo()}");
  print("Jibu ni:\n${divideTwo()}");
  print("Urefu wa string yako ni herufi:\n${stringLength()}");

  var rng = Random();
  var randomIntList = <int>[]; // Kutangaza listi tupu ya integers.
  for (var i = 0; i < 5; i++) {
    int randomNumber = rng.nextInt(100) + 1; // Inazalisha nambari kati ya 1 na 100.
    randomIntList.add(randomNumber); // Inaongeza nambari hiyo kwenye listi.
  }
  print("\n\nHapa kuna list ya nambari 5 zilizchaguliwa kwa bahati nasibu:\n$randomIntList");

  print("\nElement ya kwanza katika list hapo juu ni:\n${getFirstElement(randomIntList)}");
}
