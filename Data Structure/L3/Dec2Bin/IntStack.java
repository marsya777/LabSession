public class IntStack {


    //declare default stack size
    private static final int defaultSize=10;
    
    //declare variable for
    private int size; //size of stack
    private int top; //index for top object
    private int[]stack; //array holding integer data
    
    //constructor to Create stack using default size
    public IntStack(){
        size=defaultSize;//easier version
        top=-1;//replace all 3 lines with
        stack=new int[defaultSize];//this (defaultSize)
    }
    
    //constructor to create stack using supplied size
    public IntStack(int size){
        top=-1;
        this.size=size;
        stack=new int[size];
    }
    
    //push method: used to insert data into a top of stack
    public void push (int data){
        top++; //go to upper position
        stack[top]=data; //put data in that position
    }
    
    //pop method : to get and remove top element/data in stackpublic
    public int pop(){
        int data=stack[top]; //get data at current
        top--; //position and go down one
        return data; //step and returned the data
    }
    
    //isempty method : used to check if the stack is empty. 
    //usually used before calls to pop method.
    //returned true or false
    public boolean isempty(){
        return (top==-1); //returned true if stack is empty
    }
    
    //isfull method : used to check if the stack is full. 
    //usually used before calls to push
    //returned true or false
    public boolean isfull(){
        return (top==size-1);//returned true if stack is full
    }
    
    //length method : to get current top value
    public int length(){
        return top;
    }
    
}
