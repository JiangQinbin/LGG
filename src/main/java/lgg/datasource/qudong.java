/*     */ package lgg.datasource;
/*     */ 
/*     */ import java.io.IOException;
/*     */ import java.sql.Connection;
/*     */ import java.sql.DriverManager;
/*     */ import java.sql.PreparedStatement;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.sql.Statement;
/*     */ import java.util.Properties;
/*     */ 
/*     */

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory; public class qudong
/*     */ {
/*  14 */  /* private static String driver = null;
  15    private static String url = null;
  16    private static String user = null;
  17    private static String password = null;*/
/*     */   private static DataSource dataSource=null;
/*  19 */   static { 
	          java.io.InputStream inputStream = qudong.class.getClassLoader().getResourceAsStream("db.properties");
       Properties properties = new Properties();
              
          try {
                properties.load(inputStream);
                dataSource=BasicDataSourceFactory.createDataSource(properties);
          }
          catch (IOException e) {
         e.printStackTrace();
          } catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
/*  27 */     /*driver = properties.getProperty("driver");
  28      url = properties.getProperty("url");
  29      user = properties.getProperty("user");
  30      password = properties.getProperty("password");
          try {
  32        Class.forName(driver);
          }
          catch (ClassNotFoundException e) {
  35        e.printStackTrace();
          }*/
/*     */   
/*     */   
        /* static{
        	 try {
				Context initContxt=new InitialContext();
				dataSource=(DataSource) initContxt.lookup("java:/comp/env/jdbc/LGG");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	 
         }*/
/*  39 */   public static Connection getConnection() { 
/*     */     
/*  47 */     try {
	return dataSource.getConnection();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	throw new RuntimeException("服务器忙。。。");
}
/*     */   }
/*     */   
/*  50 */   public static void release(Connection con, Statement sta) { if (sta != null)
/*     */       try {
/*  52 */         sta.close();
/*     */       }
/*     */       catch (SQLException e) {
/*  55 */         e.printStackTrace();
/*     */       }
/*  57 */     if (con != null)
/*     */       try {
/*  59 */         con.close();
/*     */       }
/*     */       catch (SQLException e) {
/*  62 */         e.printStackTrace();
/*     */       }
/*     */   }
/*     */   
/*  66 */   public static void release(Connection con, PreparedStatement sta) { if (sta != null)
/*     */       try {
/*  68 */         sta.close();
/*     */       }
/*     */       catch (SQLException e) {
/*  71 */         e.printStackTrace();
/*     */       }
/*  73 */     if (con != null)
/*     */       try {
/*  75 */         con.close();
/*     */       }
/*     */       catch (SQLException e) {
/*  78 */         e.printStackTrace();
/*     */       }
/*     */   }
/*     */   
/*  82 */   public static void release(Connection con, Statement sta, ResultSet res) { if (res != null)
/*     */       try {
/*  84 */         res.close();
/*     */       }
/*     */       catch (SQLException e1) {
/*  87 */         e1.printStackTrace();
/*     */       }
/*  89 */     if (sta != null)
/*     */       try {
/*  91 */         sta.close();
/*     */       }
/*     */       catch (SQLException e) {
/*  94 */         e.printStackTrace();
/*     */       }
/*  96 */     if (con != null)
/*     */       try {
/*  98 */         con.close();
/*     */       }
/*     */       catch (SQLException e) {
/* 101 */         e.printStackTrace();
/*     */       }
/*     */   }
/*     */   
/* 105 */   public static void release(Connection con, PreparedStatement sta, ResultSet res) { if (res != null)
/*     */       try {
/* 107 */         res.close();
/*     */       }
/*     */       catch (SQLException e1) {
/* 110 */         e1.printStackTrace();
/*     */       }
/* 112 */     if (sta != null)
/*     */       try {
/* 114 */         sta.close();
/*     */       }
/*     */       catch (SQLException e) {
/* 117 */         e.printStackTrace();
/*     */       }
/* 119 */     if (con != null) {
/*     */       try {
/* 121 */         con.close();
/*     */       }
/*     */       catch (SQLException e) {
/* 124 */         e.printStackTrace();
/*     */       }
/*     */     }
/*     */   }
/*     */ }


/* Location:              F:\jiang\WEB-INF\classes\!\lianjieshujuku\qudong.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       0.7.1
 */