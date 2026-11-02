import java.util.*;

public class Bin2Dec {

    public static void main(String[] args) {

        // Create a stack with size 25
        IntStack s = new IntStack(25);

        // Create Scanner object
        Scanner sc = new Scanner(System.in);

        // Read binary number
        System.out.print("Enter a binary number: ");
        String binary = sc.next();

        // Check that input contains only 0 and 1
        boolean valid = true;

        for (int i = 0; i < binary.length(); i++) {
            if (binary.charAt(i) != '0' &&
                binary.charAt(i) != '1') {
                valid = false;
                break;
            }
        }

        // Display error if input is invalid
        if (!valid) {
            System.out.println("Invalid binary number!");
            sc.close();
            return;
        }

        // Check stack capacity
        if (binary.length() > 25) {
            System.out.println("Binary number is too long!");
            sc.close();
            return;
        }

        // Push each binary digit into the stack
        for (int i = 0; i < binary.length(); i++) {
            s.push(binary.charAt(i) - '0');
        }

        // Convert binary to decimal
        int answer = 0;
        int power = 0;

        while (!s.isempty()) {
            int v = s.pop();

            answer += (int) (Math.pow(2, power) * v);

            power++;
        }

        // Display decimal answer
        System.out.println("Decimal number is: " + answer);

        sc.close();
    }
}
