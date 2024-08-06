public class TaskManagementTest {
    public static void main(String[] args) {
        SinglyLinkedList taskList = new SinglyLinkedList();

        taskList.addTask(new Task("T001", "Design UI", "Pending"));
        taskList.addTask(new Task("T002", "Develop Backend", "In Progress"));
        taskList.addTask(new Task("T003", "Testing", "Completed"));

        System.out.println("Task List:");
        taskList.traverseTasks();

        System.out.println("\nSearching for Task with ID T002:");
        Task searchedTask = taskList.searchTaskById("T002");
        System.out.println(searchedTask);


        System.out.println("\nDeleting Task with ID T001:");
        taskList.deleteTaskById("T001");

        System.out.println("\nUpdated Task List:");
        taskList.traverseTasks();
    }
}
