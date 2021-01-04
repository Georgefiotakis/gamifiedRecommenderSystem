package gr.gfiotakis.imlCloud.model.gui;

public class ProsumerInformation {

    private String prosumerName;
    private String latitude;
    private String longtitude;
    private String prosumerType;
    private String prosumerDeviceMeteringType;
    private String value;
    private String timestamp;

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongtitude() {
        return longtitude;
    }

    public void setLongtitude(String longtitude) {
        this.longtitude = longtitude;
    }

    public String getProsumerName() {
        return prosumerName;
    }

    public void setProsumerName(String prosumerName) {
        this.prosumerName = prosumerName;
    }

    public String getProsumerType() {
        return prosumerType;
    }

    public void setProsumerType(String prosumerType) {
        this.prosumerType = prosumerType;
    }

    public String getProsumerDeviceMeteringType() {
        return prosumerDeviceMeteringType;
    }

    public void setProsumerDeviceMeteringType(String prosumerDeviceMeteringType) {
        this.prosumerDeviceMeteringType = prosumerDeviceMeteringType;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
