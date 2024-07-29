
public class SingletonTest {
    public static void main(String[] args) {
        // Get the first instance of Logger
        Logger logger1 = Logger.getInstance();
        logger1.log("First message");

        // Get the second instance of Logger
        Logger logger2 = Logger.getInstance();
        logger2.log("Second message");

        // Verify that both instances are the same
        if (logger1 == logger2) {
            System.out.println("Both logger instances are the same.");
        } else {
            System.out.println("Logger instances are different.");
        }
    }
}
