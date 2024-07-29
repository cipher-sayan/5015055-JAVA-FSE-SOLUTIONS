public class DecoratorPatternTest {
    public static void main(String[] args) {

        Notifier emailNotifier = new EmailNotifier();
        
        Notifier emailAndSMSNotifier = new SMSNotifierDecorator(emailNotifier);
        
        Notifier emailSMSAndSlackNotifier = new SlackNotifierDecorator(emailAndSMSNotifier);

        emailSMSAndSlackNotifier.send("This is a test message.");
    }
}
