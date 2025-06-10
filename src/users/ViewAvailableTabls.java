/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import config.Session;
import config.dbConnector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.event.TableModelEvent;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author milan
 */
public class ViewAvailableTabls extends javax.swing.JFrame {
    
   

    /**
     * Creates new form UserReportForm
     */
    public ViewAvailableTabls() {
        initComponents();
        
        String[] columnNames = {"Table ID", "Table Number", "Capacity"};
    model = new DefaultTableModel(columnNames, 0);
    tblbooking.setModel(model);
        loadAvailableTables();
    }
    
   public void displayBookingData() {
    try {
        dbConnector dbc = new dbConnector();

        String sql = "SELECT table_id, table_number, capacity, status FROM tables";

        ResultSet rs = dbc.getData(sql);

        // Column headers (add Table ID)
        String[] columnNames = {"Table ID", "Table Number", "Capacity", "Status"};

        DefaultTableModel model = new DefaultTableModel(columnNames, 0);

        while (rs.next()) {
            int tableId = rs.getInt("table_id");
            String tableNumber = rs.getString("table_number");
            int capacity = rs.getInt("capacity");
            String status = rs.getString("status");

            Object[] rowData = {tableId, tableNumber, capacity, status};
            model.addRow(rowData);
        }

        tblbooking.setModel(model);

        rs.close();
    } catch (SQLException ex) {
        System.out.println("Errors: " + ex.getMessage());
   
    }
}
   
     DefaultTableModel model = new DefaultTableModel();
   
   public void tableChanged(TableModelEvent e) {
    if (e.getType() == TableModelEvent.UPDATE) {
        int row = e.getFirstRow();
        int column = e.getColumn();

        if (row == -1 || column == -1) {
            return;
        }

        updateTablesDatabase(row, column); // You create this method to update the 'tables' DB
    }

    // Set column headers for tables table
    String[] columnNames = {"table_id", "table_number", "capacity", "status"};
    model.setColumnIdentifiers(columnNames);
    model.setRowCount(0); // Clear table

    String sql = "SELECT table_id, table_number, capacity, status FROM tables";

    try (Connection connect = new dbConnector().getConnection();
         PreparedStatement pst = connect.prepareStatement(sql);
         ResultSet rs = pst.executeQuery()) {

        while (rs.next()) {
            Object[] row = {
                rs.getInt("table_id"),
                rs.getString("table_number"),
                rs.getInt("capacity"),
                rs.getString("status")
            };
            model.addRow(row);
        }

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Database Error: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}
   
   private void updateTablesDatabase(int row, int column) {
    try {
        // Get the table_id from the first column (index 0)
        int tableId = Integer.parseInt(model.getValueAt(row, 0).toString());

        // Get the column name from the model header
        String columnName = model.getColumnName(column);

        // We don't allow updating the primary key column
        if (columnName.equalsIgnoreCase("table_id")) {
            return; // skip update if primary key column is edited
        }

        // Get the new value from the model
        Object newValue = model.getValueAt(row, column);

        String sql = "UPDATE tables SET " + columnName + " = ? WHERE table_id = ?";

        try (Connection conn = new dbConnector().getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setObject(1, newValue);
            pst.setInt(2, tableId);

            pst.executeUpdate();
        }

    } catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Update Error: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}



private void loadAvailableTables() {
    try {
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/restaurantbooking_db", "root", "");

        String sql = "SELECT table_id, table_number, capacity, status FROM tables WHERE status = 'available'";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        // Set column headers
        model.setColumnIdentifiers(new String[]{"Table ID", "Table Number", "Capacity", "Status"});
        model.setRowCount(0); // Clear existing data

        while (rs.next()) {
            int id = rs.getInt("table_id");
            String tableNumber = rs.getString("table_number");
            int capacity = rs.getInt("capacity");
            String status = rs.getString("status");

            model.addRow(new Object[]{id, tableNumber, capacity, status});
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception ex) {
        ex.printStackTrace();
        JOptionPane.showMessageDialog(this, "Error loading tables.");
    }
}



private void bookSelectedTable(int userId) {
    int selectedRow = tblbooking.getSelectedRow();

    if (selectedRow == -1) {
        JOptionPane.showMessageDialog(this, "Please select a table to book.");
        return;
    }
    

    int tableId = (int) model.getValueAt(selectedRow, 0);
    String tableNumber = model.getValueAt(selectedRow, 1).toString();
    int capacity = (int) model.getValueAt(selectedRow, 2);
    String tableStatus = model.getValueAt(selectedRow, 3).toString();

    // Open Bookingfillup form with selected values
   Bookingfilllup bookingForm = new Bookingfilllup(tableId, tableNumber, capacity, tableStatus, userId);
    bookingForm.setVisible(true);
    this.dispose(); // Close current window if needed
}





   
public void logEvent(int userId, String username, String userType) {
    dbConnector dbc = new dbConnector();
    Connection con = dbc.getConnection();
    PreparedStatement pstmt = null;
    String ut = "Active"; // Assuming the status is "Active" once logged in

    try {
        String sql = "INSERT INTO tbl_log (u_id, u_username, login_time, u_type, log_status) VALUES (?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(sql);

        pstmt.setInt(1, userId);
        pstmt.setString(2, username);
        pstmt.setTimestamp(3, new Timestamp(new Date().getTime())); // Log the current time
        pstmt.setString(4, userType);
        pstmt.setString(5, ut);

        pstmt.executeUpdate();
        System.out.println("Login log recorded successfully.");
    } catch (SQLException e) {
        System.out.println("Error recording log: " + e.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
}

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblbooking = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(51, 255, 51));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tblbooking.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Table ID", "Table Number", "Capacity", "Status"
            }
        ));
        jScrollPane1.setViewportView(tblbooking);

        jPanel2.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 80, 700, 360));

        jButton1.setText("Select");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, -1, -1));

        jButton2.setText("Refresh");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 50, -1, -1));

        jButton3.setText("Back");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(620, 40, -1, -1));

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 720, 460));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
    bookSelectedTable(1);  // just for testing

       // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        loadAvailableTables();   // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        userDashboard usf = new userDashboard();
        usf.setVisible(true);
        this.dispose();         // TODO add your handling code here:
    }//GEN-LAST:event_jButton3ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ViewAvailableTabls.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ViewAvailableTabls.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ViewAvailableTabls.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ViewAvailableTabls.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ViewAvailableTabls().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblbooking;
    // End of variables declaration//GEN-END:variables
}
