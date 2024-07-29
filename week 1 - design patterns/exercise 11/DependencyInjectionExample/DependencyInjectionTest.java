public class DependencyInjectionTest {
    public static void main(String[] args) {
     
        CustomerRepository customerRepository = new CustomerRepositoryImpl();

        CustomerService customerService = new CustomerService(customerRepository);

        Customer customer = customerService.getCustomerById("1037");
        System.out.println(customer);
    }
}
