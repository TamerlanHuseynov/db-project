package com.cydeo.day2;

import java.sql.*;

public class GettingColumnInformation {


    /*
        ResultSet object only store Row data
        It does not store any column information
        like column names , column data type , column counts
        In order to get column information
        We need to get  ResultSetMetaData object from ResultSet

        What is MetaData?  It's data about data
        ResultSetMetaData hold information about the ResultObject
        like column name column data type and count

     */

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@54.236.150.168:1521:XE" ;
        String username = "hr" ;
        String password = "hr" ;

        Connection conn = DriverManager.getConnection(url,username,password) ;
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs   = stmt.executeQuery("SELECT * FROM EMPLOYEES") ;


    }

}
