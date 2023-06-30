import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int input;
        String winner="Mohammadreza";
        Scanner sc=new Scanner(System.in);
        input=sc.nextInt();
        int dev=7;
        while (true){
            if(input/7>0){
                input/=7;
                winner="Mohammadreza";
                break;
            }
            else {
                dev=7;
            }
        }
    }
}