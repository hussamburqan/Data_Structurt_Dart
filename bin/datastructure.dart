import 'linked_list.dart';
import 'Stack.dart';

void main() {

  print('Start Stack');
  print('-------------------------------------------------------\n');
  print('Challenge 1: \nPrint ReverseStacks');

  bool isBalanced;

  print('EX 1 :');

  final stack = Stack<int>();
  stack.push(6);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack);
  printReverseStack(stack);

  print('EX 2 :');

  const list = ['K', 'M', 'O', 'K', 'U'];
  final smokeStack = Stack.of(list);
  print(smokeStack);
  printReverseStack(smokeStack);
  print(smokeStack);


  print('\n******\n');
  print('Challenge 2: \nBalance the Parentheses ');


  print('EX 1 :');

  String exampleWordOne = 'h((e))llo(world)()';
  isBalanced = balanceTheParentheses(exampleWordOne);
  print("\nIs '$exampleWordOne' balanced?: $isBalanced");

  print('EX 2 :');

  String exampleWordTwo = '(hello world';
  isBalanced = balanceTheParentheses(exampleWordTwo);
  print("\nIs '$exampleWordTwo' balanced?: $isBalanced");

  print('\n-------------------------------------------------------');
  print('End Stack\n');

  print('Start Linked List');
  print('-------------------------------------------------------');

  final linkedlist1 = LinkedList<int>();
  final linkedlist2 = LinkedList<int>();

  linkedlist2.push(3);
  linkedlist2.push(2);
  linkedlist2.push(1);

  linkedlist1.push(4);
  linkedlist1.push(2);
  linkedlist1.push(1);
  linkedlist1.append(5);
  linkedlist1.append(6);
  linkedlist1.append(7);
  print('linkedlistOne: $linkedlist1');
  print('linkedlisttwo: $linkedlist2');

  print('Challenge 1: \nPrint ReverseLinkedList');
  printReverseLinkedList(linkedlist1);

  print('\n******\n');

  print('Challenge 2: \nFindTheMiddleElement EX 1 :');
  print(linkedlist1);
  findTheMiddle(linkedlist1);
  print('\nFindTheMiddleElement EX 2 :');
  print(linkedlist2);
  findTheMiddle(linkedlist2);

  print('\n******\n');

  print('Challenge 3: \nreverseLinkedList EX 1 :');

  print(linkedlist1);
  print('ReverseLinkedList');
  reverseLinkedList(linkedlist1);
  print(linkedlist1);

  print('\nreverseLinkedList EX 2 :');

  print(linkedlist1);
  print('ReverseLinkedList');
  reverseLinkedList(linkedlist1);
  print(linkedlist1);

  print('\n******\n');
  print('Challenge 4: \nRemove All Occurrences');

  linkedlist1.push(6);
  linkedlist1.push(6);
  linkedlist1.append(32);
  linkedlist1.append(32);
  print('Before delete 32');

  print(linkedlist1);
  removeAll(32,linkedlist1);
  print('After delete 32');
  print(linkedlist1);
  removeAll(6,linkedlist1);
  print('After delete 6');
  print(linkedlist1);

  print('\n-------------------------------------------------------');
  print('End Linked List\n');

}

//Start Fun for Stack Challenge ^^
void printReverseStack<E>(Stack<E> stack) {
  if (stack.isNotEmpty) {
    E element = stack.pop();
    printReverseStack(stack);
    print(element);
    stack.push(element);
  }
}

bool balanceTheParentheses(String word) {
  var balanceStack = Stack<String>();

  for (int i = 0; i < word.length; i++) {
    String char = word[i];

    if (char == '(') {
      balanceStack.push(char);
    } else if (char == ')' && balanceStack.isEmpty) {
      return false;
    }  else if (char == ')' && balanceStack.pop() != '(') {
      return false;
    }
  }
  return balanceStack.isEmpty;
}
//End Fun for Stack Challenge ^^


//Start Fun for LinkedList Challenge ^^
void printReverseLinkedList(LinkedList list){
  if(list.isNotEmpty){
    var element = list.tail?.value;
    print(list.tail?.value);
    list.removeLast();
    printReverseLinkedList(list);
    list.append(element);

  }
}

void findTheMiddle(LinkedList list) {
  Node? middleNode = list.head;

  if (middleNode == null) {
    print('The linked list is empty');
  } else{
    for (
    Node? currentNode = list.head;
    currentNode != null && currentNode.next != null;
    currentNode = currentNode.next!.next) {
      middleNode = middleNode!.next;
    }
    print('The middle element is: ${middleNode!.value}');
  }
}

void reverseLinkedList(LinkedList list){
  if(list.isNotEmpty){
    var element = list.tail?.value;
    list.removeLast();
    reverseLinkedList(list);
    list.push(element);
  }
}

void removeAll(var value ,LinkedList list) {
  var previous = null;
  var current = list.head;
  while (current!= null){
    if(current.value == value){
      if(previous != null){
        previous.next = current.next;
      }else{
        list.head = current.next;
      }
      current = current.next;
    }else{
      previous = current;
      current = current.next;

    }
  }
  list.tail = previous;
}

//End Fun for LinkedList Challenge ^^