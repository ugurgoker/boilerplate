extension ExtensionString on String {
  String firstCharacterUppercase() {
    String value = this;
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }

  String firstCharactersUppercase() {
    String value = this;
    List<String> words = value.split(' ');
    String newString = '';
    for (var i = 0; i < words.length; i++) {
      newString += '${i == 0 ? '':' '}${words[i][0].toUpperCase()}${words[i].substring(1)}';
    }
    return newString;
  }

  String replaceTurkish() {
    String value = this;
    String str = value
        .replaceAll("İ", "i")
        .replaceAll("Ö", "o")
        .replaceAll("Ü", "u")
        .replaceAll("Ş", "s")
        .replaceAll("Ç", "c")
        .replaceAll("Ğ", "g")
        .replaceAll("ı", "i")
        .replaceAll("ö", "o")
        .replaceAll("ü", "u")
        .replaceAll("ş", "s")
        .replaceAll("ç", "c")
        .replaceAll("ğ", "g")
        .replaceAll("I", "i")
        .replaceAll(" ", "");
    return str;
  }

  String getFirstCharacter() {
    String value = this;
    return value.substring(0, 1).toUpperCase();
  }

  String getFirstCharacters() {
    String value = this;
    var str = value.split(' ');
    return (str.first.substring(0, 1) + str.last.substring(0, 1)).toUpperCase();
  }
}
