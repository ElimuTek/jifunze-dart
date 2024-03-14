
/*
Zoezi la Tatu: Control Flow katika Dart

Tengeneza programu ya Dart inayomuuliza user (mtumiaji) atoe namba, kisha inachapisha ujumbe kwenye console kulingana na vigezo vifuatavyo:

    Ikiwa namba ni kubwa kuliko 10, chapisha "Namba yako ni kubwa kuliko 10"
    Ikiwa namba ni ndogo kuliko 10, chapisha "Namba yako ni ndogo kuliko 10"
    Ikiwa namba ni sawa na 10, chapisha "Namba yako ni sawa na 10"
*/



// Library ya Dart kwa input/output.
import 'dart:io';


// Main function yetu ita call function 2 ambazo zita run bila ku return chochote.
void main () {
  jeNawezaKupigaKura();
  kubwaKuliko10 ();
}

// Kama umri ni miaka 18 au zaidi.
void jeNawezaKupigaKura() {
  // Chapisha ujumbe kwenye console ili kumwomba user aingize nambari.
  // Angalizo: Programu itasubiri input ya user katika mstari unaofuata.
  print('Karibu! Je unajua kama una haki ya kupiga kura? Una miaka mingapi? Tafadhali ingiza umri wako:');

  // Soma mstari kutoka kwa input ya kawaida (console).
  // Ikumbukwe: User input huja kama String.
  String? user_input = stdin.readLineSync();

  // 'int.tryParse' inajaribu kubadilisha string kuwa integer (namba ya kawaida).
  // Kama input si namba (mf user akisema "Hello"), 'tryParse' ita return null, kwa sababu haiwezekani kuibadilisha "Hello" kuwa integer.
  // Ikitokea input ni null (mf. mtumiaji alipiga tu "Enter"), operator ya '??' inatumika kutoa empty string (''), ili 'tryParse' isitoe error
  int? umri = int.tryParse(user_input ?? '');

  // Angalia kama user ameingiza namba (matokeo ya mstari hapo juu).
  if (umri == null) {   
  // Ikiwa 'umri' si integer, chapisha error message.
    print('Input uliyoingiza si integer (nambari ya kawaida). Tafadhali ingiza umri wako kama namba tu (idadi ya miaka), bila maneno wala herufi yoyote.');  
  } else { // "else" maana yake ikiwa input ni nambari, linganisha na 10 na uchape ujumbe unaofaa.
    // Angalia kama namba ni kubwa kuliko 18.
    if (umri > 17) {
        print('Una haki ya kupiga kura!');
    } 
    // Angalia kama umri ni 17.
    else if (umri == 17) {
      print('Huwezi kupiga kura. Bado mwaka mmoja');
      }
    // Kwa wanao umri chini ya miaka 17
    else {
      int kipindi_cha_kusubiri = 18 - umri; // Bado miaka mingapi?
      print('Huwezi kupiga kura. Bado miaka $kipindi_cha_kusubiri');
    }
  }
}


// Kama namba ni kubwa kuliko 10.
void kubwaKuliko10 () {
  // Kuuliza mtumiaji aingize namba
  print('Tafadhali ingiza namba:');

  // Kusoma input kutoka kwenye console
  String? input = stdin.readLineSync();

  // Kubadilisha input ya string kuwa integer
  int? number = int.tryParse(input ?? '');

  // Kuangalia thamani ya number na kutoa majibu kulingana na thamani hiyo
  if (number == null) {
    print('Input batili. Tafadhali ingiza namba halali.');
  } else if (number > 10) {
    print('Namba yako ni kubwa kuliko 10');
  } else if (number < 10) {
    print('Namba yako ni ndogo kuliko 10');
  } else {
    print('Namba yako ni sawa na 10');
  }
}

