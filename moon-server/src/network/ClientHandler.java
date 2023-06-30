package network;

import controller.Controller;

import javax.imageio.IIOException;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class ClientHandler extends Thread{
   private Socket socket;
   public ClientHandler(Socket socket){
       this.socket=socket;
   }

    @Override
    public void run() {
       try {
        DataInputStream dis=new DataInputStream(socket.getInputStream());
        DataOutputStream dos=new DataOutputStream(socket.getOutputStream());

        String request= dis.readUTF();
        Scanner sc=new Scanner(request);
        String command=sc.nextLine();
        String data=sc.nextLine();

        String response= new Controller().run(command,data);

        dos.writeUTF(response);
        dos.flush();

        dis.close();
        dos.close();
        socket.close();

       }catch (IOException e){

       }
    }
}
