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
import java.util.List;
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
        List<String> allLogedUsers = userService.getUsersFromSessionRegistry();
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
        if(user.getGameId()!=2 && ShipwarGame.checkIfShipsPossitionIsAvalible(user, shipPos)) {
            user.saveStringToWarTable(user.getDataBaseWarTable());
            saveShipPos(shipPos, user);

        }
        mapWarTable(user, model, "");
            return "shipwar";
        }

        @GET
        @RequestMapping(value = "/play")
        public String showPlayPage(Model model) {
            String username = UserUtilities.getLoggedUser();
            User user = userService.findUserByEmail(username);
            user.setGameId(2);
            userService.updateGameId(2, user.getId());
            user.saveStringToWarTable(user.getDataBaseWarTable());
            boolean checkPositions = ShipwarGame.checkShipsPossitionsBeforeGame(user);
            if (checkPositions) {
                User enemy = userService.findEnemyByGameId(user.getGameId(), username);
                if (enemy != null) {
                    user.setEnemyId(enemy.getId());
                    userService.updateEnemyPlayer(enemy.getId(), user.getId());
                    enemy.saveStringToWarTable(enemy.getDataBaseWarTable());

                    if (enemy.getGameId() == 2) {
                        mapWarTable(user, model, "");
                        mapWarTable(enemy, model, "enemy");
                        model.addAttribute("user", user.getName() + " " + user.getLastName());
                        model.addAttribute("enemy", enemy.getName() + " " + enemy.getLastName());
                        if(enemy.getActivePlayer()!=1) {
                            user.setActivePlayer(1);
                            userService.updateActivePlayer(1, user.getId());
                        }
                        return "play";
                    }
                }
                return "waiting";
            } else {
                userService.updateWarTable(null, user.getId());
                userService.updateGameId(1, user.getId());
                return "shipwar";
            }
        }

        @GET
        @RequestMapping(value = "/shot")
        public String updateAfterEnemyshot(@RequestParam(value = "id")String shipPos,Model model){
            String username = UserUtilities.getLoggedUser();
            User user = userService.findUserByEmail(username);
            User enemy = userService.getUserByIdEquals(user.getEnemyId());
            if(ShipwarGame.countShipsLeft(user) != 0) {
                ShipwarGame.setRoundAndShot(user, enemy, shipPos);
                userService.updateWarTable(enemy.getDataBaseWarTable(), enemy.getId());
            }else{
                model.addAttribute("userLose", "Twoja flota została zatopiona, przegrałeś bitwę !");
                user.setGameId(0);
                userService.updateGameId(0, user.getId());
                userService.updateWarTable(null, user.getId());
                user.setActivePlayer(0);
                userService.updateActivePlayer(0, user.getId());
                user.setEnemyId(0);
                userService.updateEnemyPlayer(0, user.getId());
                return "endGame";
            }
            if(ShipwarGame.countShipsLeft(enemy) == 0){
                model.addAttribute("userLose", "Zatopiłeś foltę przeciwnika, bitwa wygrana !");
                enemy.setGameId(0);
                userService.updateGameId(0, enemy.getId());
                userService.updateWarTable(null, enemy.getId());
                enemy.setActivePlayer(0);
                userService.updateActivePlayer(0, enemy.getId());
                enemy.setEnemyId(0);
                userService.updateEnemyPlayer(0, enemy.getId());
                return "endGame";
            }


            mapWarTable(user, model, "");
            mapWarTable(enemy, model, "enemy");
            model.addAttribute("user", user.getName() + " " + user.getLastName());
            model.addAttribute("enemy", enemy.getName() + " " + enemy.getLastName());

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

        @GET
        @RequestMapping(value = "/reload")
        public String reloadActiveUser(Model model){
            String username = UserUtilities.getLoggedUser();
            User user = userService.findUserByEmail(username);
            User enemy = userService.getUserByIdEquals(user.getEnemyId());

            if(user.getActivePlayer()==1) {
                model.addAttribute("activePlayer", user.getName() + " " + user.getLastName());
            }else {

                model.addAttribute("activePlayer", enemy.getName() + " " + enemy.getLastName());
            }
        return "contentRefresh";
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

