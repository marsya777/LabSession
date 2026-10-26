public class TestLinkedList {
    public static void main(String[] args) {
        MyLinkedList list = new MyLinkedList();

        // a. Add a, b, c, d, e using addFirst()
        list.addFirst(new Node("a"));
        list.addFirst(new Node("b"));
        list.addFirst(new Node("c"));
        list.addFirst(new Node("d"));
        list.addFirst(new Node("e"));

        // b. Print all elements
        System.out.print("Original list: ");
        list.printList();

        // c. Delete the last value
        list.removeLast();

        // d. Print current list
        System.out.print("After deleting last: ");
        list.printList();

        // e. Add f at the second position
        list.add(1, new Node("f"));

        // f. Print current list
        System.out.print("After adding f: ");
        list.printList();

        // g. Add g at the end
        list.addLast(new Node("g"));

        // h. Print current list
        System.out.print("After adding g: ");
        list.printList();

        // i. Delete the first element
        list.removeFirst();

        // j. Print current list
        System.out.print("After deleting first: ");
        list.printList();

        // k. Reverse the list
        list.reverse();

        // l. Print the reversed list
        System.out.print("After reversing: ");
        list.printList();
    }
}

