package andrzej.appdemo.shipwar;

import andrzej.appdemo.user.User;

public class ShipwarGame {

    public static boolean checkIfShipsPossitionIsAvalible(User user, String shipPos) {
        String[] warTable = user.getWarTable();
        if (countUsedSquares(user) < 19) {

            return true;
        }

        return false;
    }

    public static int countUsedSquares(User user) {
        String[] warTable = user.getWarTable();
        user.saveStringToWarTable(user.getDataBaseWarTable());
        int ships = 0;
        for (int i = 0; i < warTable.length; i++) {
            if (!warTable[i].equalsIgnoreCase("0")) {
                ships++;
            }
        }
        return ships;
    }

    public static boolean checkShipsPossitionsBeforeGame(User user) {
        String[] warTable = user.getWarTable();
        user.saveStringToWarTable(user.getDataBaseWarTable());
        int ship1 = 0;
        int ship2 = 0;
        int ship3 = 0;
        int ship4 = 0;
        for (int i = 0; i < warTable.length; i++) {
            boolean isShip = warTable[i].equalsIgnoreCase("1");
            if (isShip) {
                ship1++;
                //check right side
                if (!(i == 7 || i == 15 || i == 23 || i == 31 || i == 39 || i == 47 || i == 55 || i == 63)) {
                    if (checkRightSide(warTable, i)) {
                        ship1--;
                        ship2++;
                        i++;
                        if (!(i == 7 || i == 15 || i == 23 || i == 31 || i == 39 || i == 47 || i == 55 || i == 63)) {
                            if (checkRightSide(warTable, i)) {
                                ship2--;
                                ship3++;
                                i++;
                                if (!(i == 7 || i == 15 || i == 23 || i == 31 || i == 39 || i == 47 || i == 55 || i == 63)) {
                                    if (checkRightSide(warTable, i)) {
                                        ship3--;
                                        ship4++;
                                        i++;
                                        if (!(i == 7 || i == 15 || i == 23 || i == 31 || i == 39 || i == 47 || i == 55 || i == 63)) {
                                            if (checkRightSide(warTable, i)) {
                                                ship4--;
                                                return false;
                                            }

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if(ship1==3 && ship2 ==3 && ship3 ==2 && ship4==1){
            return true;
        }
        return false;
    }

    private static boolean checkRightSide(String[] warTable, int currentPos){
        if(warTable[currentPos+1].equalsIgnoreCase("1")){
            return true;
        }
        return false;
    }

    public static void setRoundAndShot(User user,User enemy, String shipPos){
        user.saveStringToWarTable(user.getDataBaseWarTable());
        enemy.saveStringToWarTable(enemy.getDataBaseWarTable());
        if(user.getActivePlayer()==1) {
            enemy.getShot(shipPos);
            if(ShipwarGame.countShipsLeft(enemy) != 0) {
                user.setActivePlayer(0);
                enemy.setActivePlayer(1);
            }
        }
    }

    public static int countShipsLeft(User user){
        String str = user.getDataBaseWarTable();
        int count = 0;

        for(int i=0; i < str.length(); i++)
        {    if(str.charAt(i) == '1')
            count++;
        }
        return count;

    }
}


