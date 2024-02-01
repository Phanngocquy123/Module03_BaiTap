package entity.service;

public class contacts {
    private String id;
    private String email;
    private String address;
    private String message;
    private boolean status;

    public contacts() {
    }

    public contacts(String id, String email, String address, String message, boolean status) {
        this.id = id;
        this.email = email;
        this.address = address;
        this.message = message;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
