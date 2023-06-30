import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int sum =0;
        int m= sc.nextInt();
        int n= sc.nextInt();
        int[] column=new int[m];
        int[] row=new int[n];

        for (int i=0 ;i<m; i++)
            column[i]= sc.nextInt();

        for (int i=0 ;i<n; i++)
            row[i]= sc.nextInt();

        for (int i=0 ;i<n;){
            for (int j=0;j<m;j+=2){
                if(i<n&&j<m)
                sum+=column[i]*row[j];
                if (j==m-1){
                    i++;
                    j=1;}
                else if (j==m-2) {
                    i++;
                    j=0;
                }

            }
        }

        System.out.println(sum);
        }
    }