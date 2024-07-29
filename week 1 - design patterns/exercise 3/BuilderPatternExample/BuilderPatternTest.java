public class BuilderPatternTest {
    public static void main(String[] args) {

        Computer gamingComputer = new Computer.Builder()
            .setCPU("Intel Core i9")
            .setRAM("32GB")
            .setStorage("1TB SSD")
            .setGPU("NVIDIA GeForce RTX 3080")
            .setMotherboard("ASUS ROG STRIX")
            .setPowerSupply("850W")
            .setCaseType("Full Tower")
            .build();

        Computer officeComputer = new Computer.Builder()
            .setCPU("Intel Core i5")
            .setRAM("16GB")
            .setStorage("512GB SSD")
            .setGPU("Integrated")
            .setMotherboard("Gigabyte B460M")
            .setPowerSupply("550W")
            .setCaseType("Mid Tower")
            .build();

        System.out.println(gamingComputer);
        System.out.println(officeComputer);
    }
}
