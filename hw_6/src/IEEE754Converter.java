import java.util.Scanner;
import java.util.Locale;

public class IEEE754Converter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in).useLocale(Locale.US);

        System.out.print("Введіть число: ");
        double number = scanner.nextDouble();
        String bit+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
        bit = getSignBit(number);
        int ieee754Bits = convertToIEEE754(number);
        System.out.println("IEEE-754 бінарне представлення: " + bit + Integer.toBinaryString(ieee754Bits));

    }

    public static String getSignBit(double number) {
        if (number > 0) {
            return "0";
        } else {
            return "";
        }
    }



    public static int convertToIEEE754(double number) {
        return Float.floatToIntBits((float) number); // Конвертація в IEEE-754
    }
}
