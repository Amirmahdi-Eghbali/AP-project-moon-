import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class Client {
    public static void main(String[] args) throws IOException {
        Socket socket =new Socket("127.0.0.1",8000);
        DataOutputStream dos=new DataOutputStream(socket.getOutputStream());
        DataInputStream dis=new DataInputStream(socket.getInputStream());
//        dos.writeUTF("send\nmessage:hello,,me:ali");
//        dos.writeUTF("get\ncount:3");
        dos.writeUTF("login\nusername:amirmahdi,,password:1234");
        dos.flush();
        System.out.println(dis.readUTF());
        dis.close();
        dos.close();
        socket.close();
    }
}
