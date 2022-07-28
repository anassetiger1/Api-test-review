package classtigerapi.runner;

import com.intuit.karate.junit5.Karate;

public class ReviewTestRunner {
	@Karate.Test

    public Karate runTest() {
        return Karate.run("classpath:features")
                .tags("EndToEnd");
    }

}


