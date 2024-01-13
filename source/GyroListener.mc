import Toybox.Lang;
import Toybox.Sensor;

class GyroListener
{
    private var _gyroData = null;

    public function onStart() as Void {
        enableGyro();
    }

    // Initializes the view and registers for accelerometer data
    private function enableGyro() as Void {
        var maxSampleRate = Sensor.getMaxSampleRate();

         // initialize gyro to request the maximum amount of data possible
        var options = {
            :period => 1, 
            :sampleRate => maxSampleRate, 
            :enableGyroscope => true};
        try {
            Sensor.registerSensorDataListener(method(:gyroHistoryCallback), options);
        }
        catch(e) {
            System.println(e.getErrorMessage());
        }
    }

    // Prints acclerometer data that is recevied from the system
    public function gyroHistoryCallback(sensorData as SensorData) as Void {
        _gyroData = sensorData.gyroscopeData;
    }

    public function getGyroData() as Sensor.gyroscopeData {
        return _gyroData;
    }
}