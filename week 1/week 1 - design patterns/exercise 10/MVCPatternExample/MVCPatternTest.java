public class MVCPatternTest {
    public static void main(String[] args) {
        Student student = new Student();
        student.setName("Sayan Nandy");
        student.setId("1037");
        student.setGrade("A");

        StudentView view = new StudentView();

        StudentController controller = new StudentController(student, view);

        controller.updateView();

        controller.setStudentName("Sayan");
        controller.setStudentGrade("B");

        controller.updateView();
    }
}
