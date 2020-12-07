import 'dart:io';

void main() {
  File file = new File("input.txt");
  var list = file.readAsLinesSync().map(int.parse).toList();
  print(multiplyTwoSum(list));
  print(multiplyThreeSum(list));
}

int multiplyTwoSum(List<int> list) {
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = 1; j < list.length; j++) {
      if (list[i] + list[j] == 2020) {
        return list[i] * list[j];
      }
    }
  }
  return -1;
}

int multiplyThreeSum(List<int> list) {
  for (var i = 0; i < list.length - 2; i++) {
    for (var j = 1; j < list.length - 1; j++) {
      for (var k = 2; k < list.length; k++) {
        if (list[i] + list[j] + list[k] == 2020) {
          return list[i] * list[j] * list[k];
        }
      }
    }
  }
  return -1;
}
