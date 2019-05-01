package andrzej.appdemo.shipwar;

import andrzej.appdemo.constants.AppDemoConstants;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.ws.rs.GET;
import java.util.Locale;
import java.util.Random;

@Controller
public class ShipwarController {
    @Autowired
    private UserService userService;


    @GET
    @RequestMapping(value = "/shipwar")
    public String showShipwarPage(Model model) {
        String username = UserUtilities.getLoggedUser();

        User user = userService.findUserByEmail(username);
        user.setGameId(1);
        userService.updateGameId(1, user.getId());
        userService.updateWarTable(null, user.getId());

        int nrRoli = user.getRoles().iterator().next().getId();
        user.setNrRoli(nrRoli);

        model.addAttribute("user_id", user.getId());
        model.addAttribute("user", user);
        return "shipwar";
    }

    @GET
    @RequestMapping(value = "/updateShip")

        public String updateShip(@RequestParam(value = "id") String shipPos, Model model){
      //  user.setWarTable();
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        if(user.getGameId()!=2) {
            user.saveStringToWarTable(user.getDataBaseWarTable());
            saveShipPos(shipPos, user);
            mapWarTable(user, model, "");
        }
            return "shipwar";
        }

        @GET
        @RequestMapping(value = "/play")
        public String showPlayPage(Model model){
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        userService.updateGameId(2, user.getId());
            user.saveStringToWarTable(user.getDataBaseWarTable());
            User enemy = userService.findEnemyByGameId(user.getGameId(), username);
            if(enemy!=null) {
                enemy.saveStringToWarTable(enemy.getDataBaseWarTable());

            if(enemy.getGameId()==2) {
            mapWarTable(user, model, "");
            mapWarTable(enemy, model, "enemy");
            model.addAttribute("user", user.getName() + " " + user.getLastName());
            model.addAttribute("enemy", enemy.getName() + " " + enemy.getLastName());
            return "play";
        }
            }
            return "waiting";
        }

        @GET
        @RequestMapping(value = "/shot")
        public String updateAfterEnemyshot(@RequestParam(value = "id")String shipPos,Model model){
            String username = UserUtilities.getLoggedUser();
            User user = userService.findUserByEmail(username);
            user.saveStringToWarTable(user.getDataBaseWarTable());
            User enemy = userService.findEnemyByGameId(user.getGameId(), username);
            enemy.saveStringToWarTable(enemy.getDataBaseWarTable());
            enemy.getShot(shipPos);
            userService.updateWarTable(enemy.getDataBaseWarTable(), enemy.getId());

            mapWarTable(user, model, "");
            mapWarTable(enemy, model, "enemy");
            model.addAttribute("user", user.getName() + " " + user.getLastName());
            model.addAttribute("enemy", user.getName() + " " + user.getLastName());
            return "play";

        }

        @GET
        @RequestMapping(value = "/logout_success")
        public String resetPlayerDataWhenLogout(Model model){
            String username = UserUtilities.getLoggedUser();
            User user = userService.findUserByEmail(username);
            model.addAttribute("username", username);
            return  "logout_success";
        }

        private void saveShipPos(String shipPos, User user){
            String[] warTable = user.getWarTable();
            warTable[AppDemoConstants.warTableMap.get(shipPos)] = "1";
            user.setWarTable(warTable);
            userService.updateWarTable(user.getDataBaseWarTable(), user.getId());
        }

        private void mapWarTable(User user, Model model, String prefix){
            String[] warTable = user.getWarTable();

            for (int i = 0; i < warTable.length; i++) {
                String attributeName = prefix + "shipPos" + i;
                model.addAttribute(attributeName, warTable[i] );
            }



        }


    }

