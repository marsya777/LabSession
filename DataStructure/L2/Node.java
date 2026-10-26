public class Node {
    String element;
    Node next;

    //default constructor creates an empty nodes
    public Node(){
        element=null;
        next=null;
    }

    //constructor for head and tail's nodes
    //to store a value and sets next to null
    public Node (String element){
        this.element=element;
        next=null;
    }
}
