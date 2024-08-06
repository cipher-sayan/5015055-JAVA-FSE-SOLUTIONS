public class SearchTest {
    public static void main(String[] args) {
      
        Product[] products = new Product[]{
            new Product("002", "Smartphone", "Electronics"),
            new Product("001", "Laptop", "Electronics"),
            new Product("003", "Headphones", "Accessories")
        };

        SearchAlgorithms.sortProducts(products);

        Product resultLinear = SearchAlgorithms.linearSearch(products, "001");
        System.out.println("Linear Search Result: " + resultLinear);

        Product resultBinary = SearchAlgorithms.binarySearch(products, "001");
        System.out.println("Binary Search Result: " + resultBinary);
    }
}
