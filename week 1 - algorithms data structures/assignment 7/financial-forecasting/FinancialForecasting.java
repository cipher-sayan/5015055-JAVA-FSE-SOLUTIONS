public class FinancialForecasting {
    
    public static double calculateFutureValue(double principal, double annualGrowthRate, int years) {
       
        if (years == 0) {
            return principal;
        }
        
        return calculateFutureValue(principal * (1 + annualGrowthRate), annualGrowthRate, years - 1);
    }
    
    public static void main(String[] args) {
        double initialPrincipal = 1000.0; 
        double annualGrowthRate = 0.05; 
        int years = 10; 
        
        double futureValue = calculateFutureValue(initialPrincipal, annualGrowthRate, years);
        System.out.println("Future Value after " + years + " years: $" + futureValue);
    }
}
