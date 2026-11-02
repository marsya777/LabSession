public class Decimal2Binary {
    public static void main (String[]args){
        Scanner sc=new Scanner (System.in);
        IntStack s=new IntStack(25);
        
        int decNumber;
        
        System.out.print("Enter a decimal number: ");
        decNumber=sc.nextInt();
        
        boolean stop=false;
        
        while(!stop){
            if (!s.isfull()){
                s.push(decNumber%2);
            }
            
            decNumber=decNumber/2;
            
            if(decNumber==0 || decNumber==1){
                if(!s.isfull()){
                    s.push(decNumber);
                }
                stop=true;
            }
        }
        
        System.out.print("Binary value: ");
        
        while(!s.isempty()){
            System.out.print(s.pop());
        }
        
        System.out.println();
        
        sc.close();
    }
}
