import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class ArmspeedtrackerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();

        // Enable sensors
        Sensor.setEnabledSensors( [Sensor.gyroscopeData] );
        Sensor.enableSensorEvents( method( :onSensor ) );
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new ArmspeedtrackerView(), new ArmspeedtrackerDelegate() ] as Array<Views or InputDelegates>;
    }

    function onSensor(sensorInfo as Sensor.Info) as Void {
        System.println( "Heart Rate: " + sensorInfo.heartRate );
    }

}

function getApp() as ArmspeedtrackerApp {
    return Application.getApp() as ArmspeedtrackerApp;
}