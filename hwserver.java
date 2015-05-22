//
//  Hello World server in Java
//  Binds REP socket to tcp://*:5112
//  Expects "Hello" from client, replies with "World"
//

import org.zeromq.ZMQ;
import java.io.*;

public class hwserver {

    public static void main(String[] args) throws Exception {
        ZMQ.Context context = ZMQ.context(1);
        
        String port = args[0];

        //  Socket to talk to clients
        ZMQ.Socket responder = context.socket(ZMQ.REP);
        responder.bind("tcp://*:" + port);

        while (!Thread.currentThread().isInterrupted()) {
            // Wait for next request from the client
            byte[] request = responder.recv(0);

            // Do some 'work'
            Thread.sleep(1000);

            String word = new String(request);
            // Print received text on server
            System.out.println("Received " + word);
            // Send transformed back to client 
            String reply = upCase(word);
            
            responder.send(reply.getBytes(), 0);
        }
        responder.close();
        context.term();
    }
    
    public static String upCase(String param) {
    	String newval = param.toUpperCase();
    	return newval;
    }
    
}