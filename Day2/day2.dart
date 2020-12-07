import 'dart:io';

void main() {
  File file = new File("input.txt");
  var list = file.readAsLinesSync();
  int counter = 0;
  int counter2 = 0;
  for (String line in list) {
    var lineSplitted = line.split(" ");
    int min = int.parse(lineSplitted[0].split("-")[0]);
    int max = int.parse(lineSplitted[0].split("-")[1]);
    String letter = lineSplitted[1].substring(0, 1);
    String password = lineSplitted[2];
    if (isPasswordOkay(min, max, letter, password)) {
      counter++;
    }
    if (isPasswordOkay2(min, max, letter, password)) {
      counter2++;
    }
  }
  print(counter);
  print(counter2);
}

bool isPasswordOkay(int min, int max, String letter, String password) {
  int count =
      password.length - password.replaceAll(new RegExp(letter), "").length;
  return min <= count && count <= max;
}

bool isPasswordOkay2(int first, int second, String letter, String password) {
  return (password[first - 1] == letter && !(password[second - 1] == letter)) ||
      (password[second - 1] == letter && !(password[first - 1] == letter));
}
