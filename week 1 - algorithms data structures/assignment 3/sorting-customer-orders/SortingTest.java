    public class SortingTest {
    public static void main(String[] args) {
        Order[] orders = new Order[]{
            new Order("1001", "Sayan", 250.75),
            new Order("1002", "Sumit", 150.25),
            new Order("1003", "Ankush", 300.50)
        };

        System.out.println("Orders sorted by Bubble Sort:");
        SortingAlgorithms.bubbleSort(orders);
        for (Order order : orders) {
            System.out.println(order);
        }

        orders = new Order[]{
            new Order("1001", "Sayan", 250.75),
            new Order("1002", "Sumit", 150.25),
            new Order("1003", "Ankush", 300.50)
        };

        System.out.println("\nOrders sorted by Quick Sort:");
        SortingAlgorithms.quickSort(orders, 0, orders.length - 1);
        for (Order order : orders) {
            System.out.println(order);
        }
    }
}
