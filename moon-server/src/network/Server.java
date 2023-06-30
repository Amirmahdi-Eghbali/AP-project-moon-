package network;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public void start() throws IOException {
        ServerSocket serverSocket=new ServerSocket(8000);
        while (true) {
            Socket socket= serverSocket.accept();
            new ClientHandler(socket).start();
        }
    }
}
