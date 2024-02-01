package entity.service.impl;

import entity.service.ContactService;
import entity.service.contacts;
import until.MySQLConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactServiceIplm implements ContactService {
    @Override
    public List<contacts> findAll() {
        List<contacts> result = new ArrayList<>();
        Connection conn = null;
        try {
           conn = MySQLConnect.open();
           String query = "SELECT * FROM contacts";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                contacts c = new contacts();
                c.setId(rs.getString("id"));
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
