public class InventoryTest {
    public static void main(String[] args) {
        Inventory inventory = new Inventory();

        Product p1 = new Product("001", "Laptop", 10, 999.99);
        Product p2 = new Product("002", "Smartphone", 25, 499.99);
        inventory.addProduct(p1);
        inventory.addProduct(p2);

        inventory.printAllProducts();

        Product p1Updated = new Product("001", "Laptop", 8, 949.99);
        inventory.updateProduct(p1Updated);

        Product retrievedProduct = inventory.getProduct("001");
        System.out.println("Retrieved: " + retrievedProduct);

        inventory.deleteProduct("002");

        inventory.printAllProducts();
    }
}
