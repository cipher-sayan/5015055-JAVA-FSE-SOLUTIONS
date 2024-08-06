public class StrategyPatternTest {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        PaymentStrategy creditCardPayment = new CreditCardPayment("John Doe", "1234567890123456", "123", "12/23");
        context.setPaymentStrategy(creditCardPayment);
        context.executePayment(250.00);

        PaymentStrategy payPalPayment = new PayPalPayment("john.doe@example.com", "password123");
        context.setPaymentStrategy(payPalPayment);
        context.executePayment(100.00);
    }
}
