public class CircularQueueTest {
    public static void main (String[]args){
        
        CircularQueue<String> circularQueue = new CircularQueue<>(8);
        
        circularQueue.enqueue("Iltizam");
        circularQueue.enqueue("Tekad");
        circularQueue.enqueue("Rajin");
        circularQueue.enqueue("Usaha");
        circularQueue.enqueue("Berjaya");
        circularQueue.enqueue("Konsisten");
        circularQueue.enqueue("Yakin");
        circularQueue.enqueue("Tabah");
        
        System.out.println("Full Circular Queue " +circularQueue);
        
        System.out.print("Dequeued following element from circular Queue");
        System.out.println(circularQueue.dequeue()+ " ");
        circularQueue.enqueue("Kuat");
        System.out.println("After enqueueing circular queue with element having value Kuat");
        System.out.println(circularQueue);
    }
}

