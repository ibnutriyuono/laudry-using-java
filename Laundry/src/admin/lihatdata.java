package admin;

import java.sql.*;


public class lihatdata {
    public static void main (String [] args){
        String kode_inp;
        String user = "root";
        String pwd = "bakmandi";
        String host = "localhost";
        String db = "TUGASBESARPBO";
        String urlValue = "";
        
        int no;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            urlValue = "jdbc:mysql://"+host+"/"+db+"?user="+user+"&password="+pwd;
            
            Connection conn = DriverManager.getConnection(urlValue);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from CUSTOMER");
            
            no = 0;
                System.out.format("+----+------------------+------------------------+"
                        + "--------------------------------+--------------+%n");
                System.out.format("| No |       NIK        |      NAMA CUSTOMER     |"
                        + "         ALAMAT CUSTOMER        |     NO HP    |%n");
            while(rs.next())
            {
                String tbl = "| %-2s | %-16s | %-22s | %-30s | %-12s |%n";
                no = no +1;
                System.out.format("+----+------------------+------------------------+"
                        + "--------------------------------+--------------+%n");
                System.out.format(tbl, " " + no, rs.getString("NIK"),rs.getString("NAMA_CUSTOMER")
                        ,rs.getString("ALAMAT_CUSTOMER"),rs.getString("NO_HP_CUSTOMER"));
            }
            System.out.format("+----+------------------+------------------------+"
                        + "--------------------------------+--------------+%n");
            if (no == 0)
            {
                System.out.println("Data IF19666 Tidak Ditemukan");
            }
            st.close();
            conn.close();
        }
        catch(SQLException e)
        {
            System.out.println("Koneksi Gagal "+e.toString());
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("JDBC Driver tidak ditemukan");
        }
    }

}