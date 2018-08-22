import java.net.*;

public class lookupj {
  public static void main(String[] args) {
    InetAddress address;
    try {
      address = InetAddress.getByName(args[0]); 
    } catch (UnknownHostException e) {
      throw new RuntimeException("Can not resolve host");
    }
    System.out.println(args[0] + " " + address.getHostAddress()); 
  }
}
