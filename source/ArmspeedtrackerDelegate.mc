import Toybox.Lang;
import Toybox.WatchUi;

class ArmspeedtrackerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new ArmspeedtrackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}