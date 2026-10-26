package implementation;
/*the code below is a simple example of a linked list that inserts new link at the beginning 
of the list, deletes from the beginning of the list and loops through the list to print the links
contained in it*/

//Start of class Node
public class Node {
    //for a node, there are two data which have 
    //two different types : int and double
    public int data1;
    public double data2;
    Node next;
    
    //constructor of the Node
    public Node (int d1, double d2){
        data1=d1;
        data2=d2;
        next=null;
    }
    
    //print node data
    public void printNode(){
        System.out.print("{" +data1+ ", "+ data2+"}");
    }
    
}//end of class Node