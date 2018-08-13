package profil;

import org.json.JSONArray;
import org.json.JSONObject;

public class Kisi {

    private String gender;
    private JSONObject name;
    private JSONObject location;
    private String email;
    private JSONObject login;
    private JSONObject dob;
    private JSONObject registered;
    private String nat;
    private String cell;
    private JSONObject picture;
    private String phone;

    public Kisi(String gender,JSONObject name,JSONObject location,String email,JSONObject login,JSONObject dob,JSONObject registered,String phone,String cell,JSONObject picture,String nat){
        this.gender = gender;
        this.name = name;
        this.location = location;
        this.email = email;
        this.login = login;
        this.dob = dob;
        this.registered= registered;
        this.cell=cell;

        this.picture = picture;
        this.nat=nat;
        this.phone=phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public JSONObject getName() {
        return name;
    }

    public void setName(JSONObject name) {
        this.name = name;
    }

    public JSONObject getLocation() {
        return location;
    }

    public void setLocation(JSONObject location) {
        this.location = location;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public JSONObject getLogin() {
        return login;
    }

    public void setLogin(JSONObject login) {
        this.login = login;
    }

    public JSONObject getDob() {
        return dob;
    }

    public void setDob(JSONObject dob) {
        this.dob = dob;
    }

    public JSONObject getRegistered() {
        return registered;
    }

    public void setRegistered(JSONObject registered) {
        this.registered = registered;
    }

    public String getNat() {
        return nat;
    }

    public void setNat(String nat) {
        this.nat = nat;
    }

    public String getCell() {
        return cell;
    }

    public void setCell(String cell) {
        this.cell = cell;
    }


    public JSONObject getPicture() {
        return picture;
    }

    public void setPicture(JSONObject picture) {
        this.picture = picture;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
