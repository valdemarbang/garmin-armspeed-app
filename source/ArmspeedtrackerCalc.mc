import Toybox.Lang;
import Toybox.Math;


class ArmspeedtrackerCalc {
    private var _gyroListener as GyroListener;
    private var _accelListener as AccelListener;
    private var _accelX = null;
    private var _accelY = null;
    private var _accelZ = null;
    private var _filter = null;
    private var _calibrateGyro = null;
    private var _calibrateAccel = null;

    //! Constructor
    public function initialize() {
        _gyroListener = new $.GyroListener();
        _accelListener = new $.AccelListener();
    }

    // Get gyro values to calibrate when the arm is still, clockface pointing up.
    // In a perfect world they would return x,y,z = 0
    public function calibrateData() {
        _calibrateGyro = _gyroListener.getGyroData();
        _calibrateAccel = _accelListener.getAccelData();
    }

    private function _filterGravityAccel(gyroData, accelData) {
        var gain = 0.001f;
        var coeff1 = 0.0278f;
        var coeff2 = 0.9444f;
        var coeff3 = 0.0278f;



        var options = {
            :coefficients => [coeff1, coeff2, coeff3] as Array<Float>,
            :gain => gain,
        };

        try {
            _filter = new Math.FirFilter(options);
        } catch (e) {
            System.println(e.getErrorMessage());
        }
        return _filter;
    }

    private function _calculateArmSpeed() {
        var gyroData = _gyroListener.getGyroData();
        var accelData = _accelListener.getAccelData();

        _filter = _filterGravityAccel(gyroData, accelData);

        //_x = filter.apply(accelData.x);
        //_y = filter.apply(accelData.x);
        //_z = filter.apply(accelData.x);

    }
}
