public class EmployeeManagementTest {
    public static void main(String[] args) {
        EmployeeManagementSystem ems = new EmployeeManagementSystem(10);

        ems.addEmployee(new Employee("E001", "Rohan", "Developer", 80000));
        ems.addEmployee(new Employee("E002", "Sumit", "Manager", 90000));
        ems.addEmployee(new Employee("E003", "Ankush", "Analyst", 70000));

        System.out.println("Employee List:");
        ems.traverseEmployees();

        System.out.println("\nSearching for Employee with ID E002:");
        Employee searchedEmployee = ems.searchEmployeeById("E002");
        System.out.println(searchedEmployee);

        System.out.println("\nDeleting Employee with ID E001:");
        ems.deleteEmployeeById("E001");

        System.out.println("\nUpdated Employee List:");
        ems.traverseEmployees();
    }
}
