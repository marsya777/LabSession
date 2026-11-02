public class MyLinkedList {
    Node head;
    Node tail;

    // Default constructor
    public MyLinkedList() {
        head = null;
        tail = null;
    }

    // Add a node at the beginning
    public void addFirst(Node e) {
        if (head == null) {
            head = e;
            tail = e;
        } else {
            e.next = head;
            head = e;
        }
    }

    // Add a node at the end
    public void addLast(Node e) {
        e.next = null;

        if (head == null) {
            head = e;
            tail = e;
        } else {
            tail.next = e;
            tail = e;
        }
    }

    // Add a node at a specific index
    public void add(int index, Node e) {
        if (index == 0) {
            addFirst(e);
        } else {
            Node current = head;
            int i = 0;

            while (i < index - 1 && current != null) {
                current = current.next;
                i++;
            }

            if (current != null) {
                e.next = current.next;
                current.next = e;

                if (e.next == null) {
                    tail = e;
                }
            }
        }
    }

    // Remove the first node
    public Node removeFirst() {
        if (head == null) {
            return null;
        }

        Node temp = head;
        head = head.next;

        if (head == null) {
            tail = null;
        }

        temp.next = null;
        return temp;
    }

    // Remove the last node
    public Node removeLast() {
        if (head == null) {
            return null;
        }

        Node temp = tail;

        if (head == tail) {
            head = null;
            tail = null;
        } else {
            Node current = head;

            while (current.next != tail) {
                current = current.next;
            }

            tail = current;
            tail.next = null;
        }

        return temp;
    }

    // Print all nodes
    public void printList() {
        Node current = head;

        while (current != null) {
            System.out.print(current.element + " ");
            current = current.next;
        }

        System.out.println();
    }

    // Reverse the linked list
    //change the direction of the links, doesnt create new nodes

    public void reverse() {
        Node previous = null;
        Node current = head;
        Node nextNode;

        tail = head;

        while (current != null) {
            nextNode = current.next;
            current.next = previous;
            previous = current;
            current = nextNode;
        }

        head = previous;
    }
}
