class Validiation {
  String removeAllchart(String value ){
    return normalise(normalise(value));
  }
  bool isString(String em) {

    String p = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.[a-zA-Z]+)$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
  bool isEmail(String em) {

    String p = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool validatePassword(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String normalise(String input) => input
      .replaceAll('\u0610', '') //ARABIC SIGN SALLALLAHOU ALAYHE WA SALLAM
      .replaceAll('\u0611', '') //ARABIC SIGN ALAYHE ASSALLAM
      .replaceAll('\u0612', '') //ARABIC SIGN RAHMATULLAH ALAYHE
      .replaceAll('\u0613', '') //ARABIC SIGN RADI ALLAHOU ANHU
      .replaceAll('\u0614', '') //ARABIC SIGN TAKHALLUS

  //Remove koranic anotation
      .replaceAll('\u0615', '') //ARABIC SMALL HIGH TAH
      .replaceAll(
      '\u0616', '') //ARABIC SMALL HIGH LIGATURE ALEF WITH LAM WITH YEH
      .replaceAll('\u0617', '') //ARABIC SMALL HIGH ZAIN
      .replaceAll('\u0618', '') //ARABIC SMALL FATHA
      .replaceAll('\u0619', '') //ARABIC SMALL DAMMA
      .replaceAll('\u061A', '') //ARABIC SMALL KASRA
      .replaceAll('\u06D6',
      '') //ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA
      .replaceAll('\u06D7',
      '') //ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA
      .replaceAll('\u06D8', '') //ARABIC SMALL HIGH MEEM INITIAL FORM
      .replaceAll('\u06D9', '') //ARABIC SMALL HIGH LAM ALEF
      .replaceAll('\u06DA', '') //ARABIC SMALL HIGH JEEM
      .replaceAll('\u06DB', '') //ARABIC SMALL HIGH THREE DOTS
      .replaceAll('\u06DC', '') //ARABIC SMALL HIGH SEEN
      .replaceAll('\u06DD', '') //ARABIC END OF AYAH
      .replaceAll('\u06DE', '') //ARABIC START OF RUB EL HIZB
      .replaceAll('\u06DF', '') //ARABIC SMALL HIGH ROUNDED ZERO
      .replaceAll('\u06E0', '') //ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO
      .replaceAll('\u06E1', '') //ARABIC SMALL HIGH DOTLESS HEAD OF KHAH
      .replaceAll('\u06E2', '') //ARABIC SMALL HIGH MEEM ISOLATED FORM
      .replaceAll('\u06E3', '') //ARABIC SMALL LOW SEEN
      .replaceAll('\u06E4', '') //ARABIC SMALL HIGH MADDA
      .replaceAll('\u06E5', '') //ARABIC SMALL WAW
      .replaceAll('\u06E6', '') //ARABIC SMALL YEH
      .replaceAll('\u06E7', '') //ARABIC SMALL HIGH YEH
      .replaceAll('\u06E8', '') //ARABIC SMALL HIGH NOON
      .replaceAll('\u06E9', '') //ARABIC PLACE OF SAJDAH
      .replaceAll('\u06EA', '') //ARABIC EMPTY CENTRE LOW STOP
      .replaceAll('\u06EB', '') //ARABIC EMPTY CENTRE HIGH STOP
      .replaceAll('\u06EC', '') //ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE
      .replaceAll('\u06ED', '') //ARABIC SMALL LOW MEEM

  //Remove tatweel
      .replaceAll('\u0640', '')

  //Remove tashkeel
      .replaceAll('\u064B', '') //ARABIC FATHATAN
      .replaceAll('\u064C', '') //ARABIC DAMMATAN
      .replaceAll('\u064D', '') //ARABIC KASRATAN
      .replaceAll('\u064E', '') //ARABIC FATHA
      .replaceAll('\u064F', '') //ARABIC DAMMA
      .replaceAll('\u0650', '') //ARABIC KASRA
      .replaceAll('\u0651', '') //ARABIC SHADDA
      .replaceAll('\u0652', '') //ARABIC SUKUN
      .replaceAll('\u0653', '') //ARABIC MADDAH ABOVE
      .replaceAll('\u0654', '') //ARABIC HAMZA ABOVE
      .replaceAll('\u0655', '') //ARABIC HAMZA BELOW
      .replaceAll('\u0656', '') //ARABIC SUBSCRIPT ALEF
      .replaceAll('\u0657', '') //ARABIC INVERTED DAMMA
      .replaceAll('\u0658', '') //ARABIC MARK NOON GHUNNA
      .replaceAll('\u0659', '') //ARABIC ZWARAKAY
      .replaceAll('\u065A', '') //ARABIC VOWEL SIGN SMALL V ABOVE
      .replaceAll('\u065B', '') //ARABIC VOWEL SIGN INVERTED SMALL V ABOVE
      .replaceAll('\u065C', '') //ARABIC VOWEL SIGN DOT BELOW
      .replaceAll('\u065D', '') //ARABIC REVERSED DAMMA
      .replaceAll('\u065E', '') //ARABIC FATHA WITH TWO DOTS
      .replaceAll('\u065F', '') //ARABIC WAVY HAMZA BELOW
      .replaceAll('\u0670', '') //ARABIC LETTER SUPERSCRIPT ALEF

  //Replace Waw Hamza Above by Waw
      .replaceAll('\u0624', '')

  //Replace Ta Marbuta by Ha
      .replaceAll('\u0629', '')

  //Replace Ya
  // and Ya Hamza Above by Alif Maksura
      .replaceAll('\u064A', '')
      .replaceAll('\u0626', '')

  // Replace Alifs with Hamza Above/Below
  // and with Madda Above by Alif
      .replaceAll('\u0622', '')
      .replaceAll('\u0623', '')
      .replaceAll('\u0625', '')

      .replaceAll('q', '').replaceAll('Q', '')
      .replaceAll('w', '').replaceAll('W', '')
      .replaceAll('e', '').replaceAll('E', '')
      .replaceAll('r', '').replaceAll('R', '')
      .replaceAll('t', '').replaceAll('T', '')
      .replaceAll('y', '').replaceAll('Y', '')
      .replaceAll('u', '').replaceAll('U', '')
      .replaceAll('i', '').replaceAll('I', '')
      .replaceAll('o', '').replaceAll('O', '')
      .replaceAll('p', '').replaceAll('P', '')
      .replaceAll('a', '').replaceAll('A', '')
      .replaceAll('s', '').replaceAll('S', '')
      .replaceAll('d', '').replaceAll('D', '')
      .replaceAll('f', '').replaceAll('F', '')
      .replaceAll('g', '').replaceAll('G', '')
      .replaceAll('h', '').replaceAll('H', '')
      .replaceAll('j', '').replaceAll('J', '')
      .replaceAll('k', '').replaceAll('K', '')
      .replaceAll('l', '').replaceAll('L', '')
      .replaceAll('z', '').replaceAll('Z', '')
      .replaceAll('x', '').replaceAll('X', '')
      .replaceAll('c', '').replaceAll('C', '')
      .replaceAll('v', '').replaceAll('V', '')
      .replaceAll('b', '').replaceAll('B', '')
      .replaceAll('n', '').replaceAll('N', '')
      .replaceAll('m', '').replaceAll('M', '')
      .replaceAll('-', '').replaceAll(' ', '').replaceAll(',', '')





  ;

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  bool FN_containNumber(String text)
  {
    if(text.contains(RegExp(r"[0-9]")))
    {
      return true;
    }
    else{
      return false;
    }
  }
  bool FN_containUpper(String text)
  {
    if(text.contains(RegExp(r"[A-Z]")))
    {
      return true;
    }
    else{
      return false;
    }
  }
  bool FN_containSpecial(String text)
  {
    if(text.contains(RegExp(r"[!@#$%^&*()_+\-=\[\]{};':\\|,.<>\/?]")))
    {
      return true;
    }
    else{
      return false;
    }
  }

}