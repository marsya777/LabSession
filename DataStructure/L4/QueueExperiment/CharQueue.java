import java.util.ArrayList;
public class CharQueue {
    char q[]; //q is an array of chars
    int front,rear; //positions of the front and back items
    int size; //maximum capacity of the array

    // default Constructor 
    public CharQueue(int m){
        size=m;
        q=new char[size];
        front=rear=-1; //the queue is empty
    }

    //place item at the back of the queue
    public void enqueue(char n){
        if(isFull()){
            System.out.println("Queue is full.");
        }else{
            if(front==-1){ //if front is empty 
                front=rear=0; //then set index=0 means one character is in 
            }else{
                rear++; //if its not the first char just rear index++
            }
            q[rear]=n; //store the character at q[rear]
        }
    }

    //copies each item from front to rear when: front>0
    //queue is full, has dead data and want to enqueue new item

    /*
    private void shiftForward(){
        int j=0;
        for(int i=front;i<=rear;i++){
            q[j]=q[i];
            j++;
        }
        front=0;
        rear=j-1;
    }*/

    //retrieves the element at the front of the queue and removes it from the queue
    public char dequeue(){
        if(isEmpty()){ //means no char to return
            System.out.println("Queue is empty.");
            return (char) 250; //return special error character 
        }else{
            char x=q[front]; //saves the front item in x 
            front++; //move front one step ahead means from 0 to 1
            return x; //x is still physically there, but no longer part of the queue
        }
    }

    //retrieves the element at the front of the queue without removing it from the queue
    public char peek(){
        return q[front];
    }

    boolean isEmpty(){
        return (front==-1 || front>rear);
        //front==1 means nothing has ever been added 
        //or front has moved past rear means everything was dequeued
    }

    boolean isFull(){ //when rear reaches the last index of the array
        return (rear==size-1);
    }

    public void display(){
        if(isEmpty()){
            System.out.println("Queue is empty.");
            return;
        }
        System.out.print("Queue: ");
        for(int i=front;i<=rear;i++){
            System.out.print(q[i]+" ");
        }
        System.out.println();
    }
    //end of CharQueue class
}
