import java.util.ArrayList;

public class QueueExperiment {
    public static void main (String[]args){
        CharQueue myQueue=new CharQueue(10);
        myQueue.enqueue('a');
        myQueue.enqueue('b');
        myQueue.enqueue('c');
        myQueue.enqueue('d');
        myQueue.enqueue('e');
        myQueue.enqueue('f');
        myQueue.enqueue('g');
        myQueue.enqueue('h');
        myQueue.enqueue('i');
        myQueue.enqueue('j');

        myQueue.display();

        System.out.println("First element in queue: "+myQueue.peek());
    }
}
