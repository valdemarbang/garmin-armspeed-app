import Toybox.Lang;
import Toybox.Sensor;

class AccelListener
{
    private var _accelData = null;

    public function onStart() as Void {
        enableAccel();
    }

    // Initializes the view and registers for accelerometer data
    private function enableAccel() as Void {
        var maxSampleRate = Sensor.getMaxSampleRate();

         // initialize accelerometer to request the maximum amount of data possible
        var options = {
            :period => 1, 
            :sampleRate => maxSampleRate, 
            :enableAccelerometer => true};
        try {
            Sensor.registerSensorDataListener(method(:accelHistoryCallback), options);
        }
        catch(e) {
            System.println(e.getErrorMessage());
        }
    }

    // Prints acclerometer data that is recevied from the system
    public function accelHistoryCallback(sensorData as SensorData) as Void {
        _accelData = sensorData.accelerometerData;
    }

    public function getAccelData() as Sensor.accelerometerData {
        return _accelData;
    }
}