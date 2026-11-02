package testing;

public class LinkList {
    Node head;
    Node tail;

    public void addFirst(Node e){

        if(head==null){
            head=null;
            tail=null;
        }else{
            e.next=head;
            head=e;
        }


    }
}
