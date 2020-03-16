//  Good morning! Here's your coding interview problem for today.
//
//  Suppose an arithmetic expression is given as a binary tree. Each leaf is an
//  integer and each internal node is one of '+', '−', '∗', or '/'.
//
//  Given the root to such a tree, write a function to evaluate it.
//
//  For example, given the following tree:
//
//         *
//      /     \
//     +       +
//    /  \    / \
//   3    2  4   5
//  You should return 45, as it is (3 + 2) * (4 + 5).

class Leaf{
  dynamic value;
  Leaf left;
  Leaf right;
  Leaf(this.value);
  int calculateValue(){
    if(value is int){
      return value;
    }
    else{
      return (math_it_up[value](left.calculateValue(), right.calculateValue()));
    }
  }
}

Map math_it_up = {
  '+': (x, y) => x + y,
  '-': (x, y) => x - y,
  '/': (x, y) => x / y,
  '*': (x, y) => x * y,
};

void main() {
  Leaf leaf1 = Leaf('*');
  Leaf leaf2 = Leaf('+');
  Leaf leaf3 = Leaf('+');
  leaf1.left = leaf2;
  leaf1.right = leaf3;
  leaf2.left = Leaf(3);
  leaf2.right = Leaf(2);
  leaf3.left = Leaf(4);
  leaf3.right = Leaf(5);
  print(leaf1.calculateValue());
}
