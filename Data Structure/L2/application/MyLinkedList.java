public class MyLinkedList {
    Node head;
    Node tail;

    // Default constructor
    public MyLinkedList() {//runs when create a new object
        head = null;
        tail = null;
    }

    // Add a node at the beginning
    public void addFirst(Node e) {
        if (head == null) { //checks whether list is empty
            head = e; //then new node will become head and tail
            tail = e;
        } else { //if list isnt empty
            e.next = head; //push new node as new head 
            head = e; //update the changes
        }
    }

    // Add a node at the end
    public void addLast(Node e) {
        e.next = null;  //makes new node points to nothing (no reference)

        if (head == null) { //if list is empty
            head = e; //new node become new head and tail
            tail = e;
        } else { //list isnt empty
            tail.next = e; //connect the new node as new tail
            tail = e; //updates new node as new tail
        }
    }

    // Add a node at a specific index
    public void add(int index, Node e) {
        if (index == 0) { //checks if index is 0 (beginning)
            addFirst(e); //applied method just add at the first index
        } else { //if index is other than 0
            Node current = head; //creates reference named current as new head
            int i = 0; //start a counter to track new current position

            while (i < index - 1 && current != null) { 
                //stops at the node immediately before the insertion phase
                //index-1: because insertion requires access to the node before the desired position so u can  change its link
                //and list must have a node
                current = current.next; //moves to next node
                i++; //increases counter by one
            }

            //insertion phase
            if (current != null) { //checks that list contains node
                e.next = current.next; //makes new node point to the node that used to follow current
                current.next = e; //connects current to the new node

                if (e.next == null) { //if new node has no following node, then inserted at the end
                    tail = e; //update tail
                }
            }
        }
    }

    // Remove the first node
    public Node removeFirst() {
        if (head == null) { //checks if list is empty 
            return null;//no node to return
        }

        Node temp = head; //saves the current first node(head) in a temporary reference called temp
        head = head.next; //moves head to second node
        //second node becomes the first node

        if (head == null) { //checks if list became empty after removing the first node
            tail = null; //then tail also null
        }

        temp.next = null; //disconnect the removed node from the rest of the list
        return temp; //return the removed node to the caller

        //A>B>C becomes B>C, and the method returns node A
    }

    // Remove the last node
    public Node removeLast() {
        if (head == null) { //checks if list is empty
            return null; //then nothing to return
        }

        Node temp = tail; //saves the last node as temp so it can be return later

        if (head == tail) {//check if theres only one node in a list
            head = null;//then both head and tail becomes null after the removal
            tail = null;
        } else {
            Node current = head; //starts a temporary reference at the first node

            //moves the current forward until its next node is the current tail
            while (current.next != tail) {
                current = current.next;
            }

            tail = current; //updates tail so it points to the second last node 
            tail.next = null;//disconnect the removed  last node
        }

        return temp; //return the removal nodes
    }

    // Print all nodes
    public void printList() {
        Node current = head; //set head as current, starts at first node

        while (current != null) {//while list isnt null
            System.out.print(current.element + " ");//print 
            current = current.next;//keep moving to the next node
        }

        System.out.println();
    }

    // Reverse the linked list
    //change the direction of the links, doesnt create new nodes

    public void reverse() {
        Node previous = null; //creates reference called previous, points to nothing
        Node current = head;//starts at first node
        Node nextNode;//declares reference to temporary saves the next node

        tail = head; //last node become first node

        while (current != null) {//while list isnt empty
            nextNode = current.next; //saves the next node before changing any links
            current.next = previous; //reverse the current nodes link so t points backward
            previous = current;//moves previous forward to the current node
            current = nextNode;//moves current to the next node saved earlier
        }

        head = previous; //previous points to the original last node 
        
    }
}
