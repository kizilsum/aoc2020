import 'dart:io';

void main() {
  File file = new File("input.txt");
  var list = file.readAsLinesSync();
  var passportList = generatePassports(list);
  int counter = 0;
  int counter2 = 0;
  passportList.forEach((element) {
    if (element.isValid()) {
      counter++;
    }
    if (element.isDataValid()) {
      counter2++;
    }
  });
  print(passportList.length);
  print(counter);
  print(counter2);
}

List<Passport> generatePassports(List<String> list) {
  List<Passport> passportList = List.empty(growable: true);
  String passportString = "";
  for (var i = 0; i < list.length; i++) {
    if (list[i].isNotEmpty) {
      passportString += " " + list[i];
      if (i == list.length - 1) {
        passportList.add(new Passport(passportString.trim()));
      }
    } else {
      passportList.add(new Passport(passportString.trim()));
      passportString = "";
    }
  }
  return passportList;
}

class Passport {
  String byr;
  String iyr;
  String eyr;
  String hgt;
  String hcl;
  String ecl;
  String pid;
  String cid;

  Passport(String str) {
    var list = str.split(" ");
    for (var prop in list) {
      var keyVal = prop.split(":");
      setKeyValToProp(keyVal[0], keyVal[1]);
    }
  }

  void setKeyValToProp(String key, String val) {
    switch (key) {
      case "byr":
        this.byr = val;
        break;
      case "iyr":
        this.iyr = val;
        break;
      case "eyr":
        this.eyr = val;
        break;
      case "hgt":
        this.hgt = val;
        break;
      case "hcl":
        this.hcl = val;
        break;
      case "ecl":
        this.ecl = val;
        break;
      case "pid":
        this.pid = val;
        break;
      default:
        break;
    }
  }

  bool isValid() {
    return byr != null &&
        iyr != null &&
        eyr != null &&
        hgt != null &&
        hcl != null &&
        ecl != null &&
        pid != null;
  }

  bool isDataValid() {
    if (!isValid()) {
      return false;
    }
    int byrInt = int.tryParse(byr);
    if (!(byrInt != null && byrInt >= 1920 && byrInt <= 2002)) {
      // print("byr: " + byr);
      return false;
    }
    int iyrInt = int.tryParse(iyr);
    if (!(iyrInt != null && iyrInt >= 2010 && iyrInt <= 2020)) {
      // print("iyr: " + iyr);
      return false;
    }
    int eyrInt = int.tryParse(eyr);
    if (!(eyrInt != null && eyrInt >= 2020 && eyrInt <= 2030)) {
      // print("eyr: " + eyr);
      return false;
    }
    if (hgt.contains("cm")) {
      int height = int.tryParse(hgt.split("cm")[0]);
      if (!(height != null && height >= 150 && height <= 193)) {
        // print("hgt: " + hgt);
        return false;
      }
    } else if (hgt.contains("in")) {
      int height = int.tryParse(hgt.split("in")[0]);
      if (!(height != null && height >= 59 && height <= 76)) {
        // print("hgt: " + hgt);
        return false;
      }
    } else {
      return false;
    }

    RegExp regExp = new RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$');
    if (!regExp.hasMatch(hcl)) {
      // print("hcl: " + hcl);
      return false;
    }
    List<String> eyeColorList =
        {"amb", "blu", "brn", "gry", "grn", "hzl", "oth"}.toList();
    if (!eyeColorList.contains(ecl)) {
      // print("ecl: " + ecl);
      return false;
    }
    if (!(RegExp(r'^\d{9}$').hasMatch(pid))) {
      // print("pid: " + pid);
      return false;
    }

    print("hgt: " + hgt);
    return true;
  }
}
