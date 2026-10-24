import com.intuit.karate.junit5.Karate;


public class UserTest {

    @Karate.Test
    public Karate testUser() {
        return Karate.run("user/user").relativeTo(getClass());
    }
}