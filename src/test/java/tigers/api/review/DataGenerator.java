package tigers.api.review;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;


public class DataGenerator {
	
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName()+ faker.name().lastName()+ "@gmail.com";	
	}
	public  static String getphoneNumber() {

        Faker faker = new  Faker();

    return faker.phoneNumber().cellPhone();

    
    }
	
	public static String getfirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
	}
	public static String getlastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}
	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
		return format.format(date);
	}
	public static String getCity() {
        Faker faker = new Faker();
        return faker.address().cityName();


    }
    public static String addressType() {
        Faker faker = new Faker();
        return faker.address().buildingNumber();

    }
    public static String getEmplo() {
        Faker faker = new Faker();
        return faker.job().field();

    }
    public static String getCountryCode() {
        Faker faker = new Faker();
        return faker.address().countryCode();

    }

    public static String getZip() {
        Faker faker = new Faker();
        return faker.address().zipCode();
    }
    public static String phoneExtension() {
        Faker faker = new Faker();
        return faker.phoneNumber().extension();

    }
}

