public class LibraryManagementTest {
    public static void main(String[] args) {
        LibraryManagementSystem library = new LibraryManagementSystem();

        library.addBook(new Book("B001", "The White Tiger", "Aravind Adiga"));
        library.addBook(new Book("B002", "Midnight's Children", "Salman Rushdie"));
        library.addBook(new Book("B003", "The God of Small Things", "Arundhati Roy"));
        library.addBook(new Book("B004", "A Fine Balance", "Rohinton Mistry"));
        library.addBook(new Book("B005", "Train to Pakistan", "Khushwant Singh"));

        library.sortBooksByTitle();

        System.out.println("Finding 'Midnight's Children' using linear search:");
        Book book1 = library.findBookByTitleLinear("Midnight's Children");
        System.out.println(book1);

        System.out.println("\nFinding 'Midnight's Children' using binary search:");
        Book book2 = library.findBookByTitleBinary("Midnight's Children");
        System.out.println(book2);
    }
}
