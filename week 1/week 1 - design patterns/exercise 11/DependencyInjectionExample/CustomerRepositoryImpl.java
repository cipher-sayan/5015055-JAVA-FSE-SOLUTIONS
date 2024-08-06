public class CustomerRepositoryImpl implements CustomerRepository {

    @Override
    public Customer findCustomerById(String id) {
        
        return new Customer(id, "Sayan Nandy", "sayannandy25.02@gmail.com");
    }
}
