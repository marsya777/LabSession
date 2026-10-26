public class FanTest {
    
    public static void main (String []args){
        //create two objects 
        Fan f1 = new Fan (3,true,10,"merah");
        Fan f2 = new Fan (2,false,5,"biru");

        //display statements
        System.out.println(f1.toString());
        System.out.println(f2.toString());
    }
}