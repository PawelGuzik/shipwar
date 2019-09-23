package andrzej.appdemo.service;

import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserRepository;
import andrzej.appdemo.user.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class UserServiceTest {

    @Autowired
    private UserRepository repository;
    @Autowired
    private UserService service;

    // To test this you should make new db H2

    @BeforeEach
    void init() {
     //   repository.deleteAll();
    }

    @Test
    void bookListShouldBeEmptyOnStart() {
        //when
        List<User> userList = service.findAll();
        //then
        assertTrue(userList.isEmpty());
    }

    @Test
    void userListShouldContainNewData() {
        //given
        String dataBaseWarTableTest = "0000000000000000000000000000000000000000000000000000000000000000";
        User user = new User();
        user.setDataBaseWarTable(dataBaseWarTableTest);
        service.saveUser(user);
        //when
        List<User> userList = service.findAll();
        //then
         User userFormList = userList.get(0);
        assertEquals(dataBaseWarTableTest, userFormList.getDataBaseWarTable());

    }

    @Test
    void shouldReturnEmptyListAfterDeletingExistingBook() {
        //given
        User existingUser = new User();
        service.saveUser(existingUser);
        //when
        service.findAll();
        List<User> userList = service.findAll();
        //then
        assertTrue(userList.isEmpty());
    }

}
