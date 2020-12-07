import 'dart:io';

void main() {
  File file = new File("input.txt");
  var list = file.readAsLinesSync();
  int firstPartResult = traverseTheMap(list, 3, 1);
  print("First part:");
  print(firstPartResult);

  print("Second part:");
  print(traverseTheMap(list, 1, 1) *
      traverseTheMap(list, 3, 1) *
      traverseTheMap(list, 5, 1) *
      traverseTheMap(list, 7, 1) *
      traverseTheMap(list, 1, 2));
}

int traverseTheMap(List<String> list, int speedX, int speedY) {
  int counter = 0;
  int length = list[0].length;
  int posX = 0;
  for (var i = 0; i < list.length; i += speedY) {
    posX += speedX;
    if (i < list.length - speedY) {
      if (list[i + speedY][posX % length] == "#") {
        counter++;
      }
    }
  }
  return counter;
}
