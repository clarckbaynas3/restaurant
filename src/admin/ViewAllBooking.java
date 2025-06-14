/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import config.dbConnector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author milan
 */
public class ViewAllBooking extends javax.swing.JFrame {

    /**
     * Creates new form ViewAllBooking
     */
    public ViewAllBooking() {
        initComponents();
        
        displayBookingData();
    }

    
    public void displayBookingData() {
    try {
        dbConnector dbc = new dbConnector();

        String sql = "SELECT b.booking_id, t.table_number, b.status, b.booking_time " +
                     "FROM bookings b " +
                     "JOIN tables t ON b.table_id = t.table_id";

        ResultSet rs = dbc.getData(sql);

        // Include booking_id but hide it from the user by not showing in JTable columns
        String[] columnNames = {"Booking ID", "Table Number", "Status", "Booking Time"};

        DefaultTableModel bookingModel = new DefaultTableModel(columnNames, 0);

        while (rs.next()) {
            int bookingId = rs.getInt("booking_id");
            String tableNumber = rs.getString("table_number");
            String status = rs.getString("status");
            String bookingTime = rs.getString("booking_time");

            Object[] rowData = {bookingId, tableNumber, status, bookingTime};
            bookingModel.addRow(rowData);
        }

        tblbooking.setModel(bookingModel);

        // Hide the booking_id column in JTable visually
        tblbooking.getColumnModel().getColumn(0).setMinWidth(0);
        tblbooking.getColumnModel().getColumn(0).setMaxWidth(0);
        tblbooking.getColumnModel().getColumn(0).setWidth(0);

        rs.close();
    } catch (SQLException ex) {
        System.out.println("Errors: " + ex.getMessage());
    }
}

private void updateBookingStatus(int bookingId, String newStatus) {
    try {
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/restaurantbooking_db", "root", "");

        // First, update the booking status
        String updateBookingSql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        PreparedStatement updateBookingStmt = conn.prepareStatement(updateBookingSql);
        updateBookingStmt.setString(1, newStatus);
        updateBookingStmt.setInt(2, bookingId);
        updateBookingStmt.executeUpdate();

        // Then, get the table_id associated with this booking
        String getTableIdSql = "SELECT table_id FROM bookings WHERE booking_id = ?";
        PreparedStatement getTableStmt = conn.prepareStatement(getTableIdSql);
        getTableStmt.setInt(1, bookingId);
        ResultSet rs = getTableStmt.executeQuery();

        if (rs.next()) {
            int tableId = rs.getInt("table_id");

            // If booking is approved, mark table as 'booked'
            if ("approved".equalsIgnoreCase(newStatus)) {
                String updateTableSql = "UPDATE tables SET status = 'booked' WHERE table_id = ?";
                PreparedStatement updateTableStmt = conn.prepareStatement(updateTableSql);
                updateTableStmt.setInt(1, tableId);
                updateTableStmt.executeUpdate();
            }
        }

        conn.close();
        JOptionPane.showMessageDialog(this, "Booking status updated to " + newStatus);
    } catch (Exception ex) {
        ex.printStackTrace();
        JOptionPane.showMessageDialog(this, "Failed to update booking status.");
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

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblbooking = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        area = new javax.swing.JTextArea();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(102, 255, 102));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tblbooking.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Booking ID", "Table Number", "Status", "Booking Time"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, true, true, true
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblbooking);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, 670, 360));

        jButton1.setText("Select");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 70, 70, -1));

        jButton2.setText("Reject");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 70, -1, -1));

        jButton3.setText("Refresh");
        jPanel1.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 70, -1, -1));

        jButton4.setText("Back");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton4, new org.netbeans.lib.awtextra.AbsoluteConstraints(620, 60, -1, -1));

        area.setColumns(20);
        area.setFont(new java.awt.Font("Monospaced", 1, 13)); // NOI18N
        area.setRows(5);
        jScrollPane2.setViewportView(area);

        jPanel1.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 130, 240, 230));

        jButton5.setBackground(new java.awt.Color(255, 255, 255));
        jButton5.setText("Reset");
        jButton5.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton5, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 390, 80, 40));

        jButton6.setBackground(new java.awt.Color(255, 255, 255));
        jButton6.setText("Print Receipt");
        jButton6.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton6, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 390, 110, 40));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1060, 490));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
  int selectedRow = tblbooking.getSelectedRow();

if (selectedRow == -1) {
    JOptionPane.showMessageDialog(this, "Please select a booking to approve.");
    return;
}

// Get booking_id from table
int bookingId = (int) tblbooking.getModel().getValueAt(selectedRow, 0);

// Approve booking in DB
updateBookingStatus(bookingId, "approved");

// Refresh data
displayBookingData();

// Fetch full booking details from DB
try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantbooking_db", "root", "")) {

    String sql = "SELECT b.booking_id, b.user_id, b.u_fname, b.u_lname, b.table_id, t.table_number, b.status, b.booking_time " +
                 "FROM bookings b " +
                 "JOIN tables t ON b.table_id = t.table_id " +
                 "WHERE b.booking_id = ?";
    
    PreparedStatement pst = conn.prepareStatement(sql);
    pst.setInt(1, bookingId);
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
        // Clear the receipt area
        area.setText("");

        // Header
        area.append("*********************************************\n");
        area.append("*         Restaurant Booking Receipt        *\n");
        area.append("*********************************************\n\n");

        // Date
        area.append("Date: " + new java.util.Date().toString() + "\n\n");

        // Booking Details
        area.append("Booking ID     : " + rs.getInt("booking_id") + "\n");
        area.append("User ID        : " + rs.getInt("user_id") + "\n");
        area.append("Name           : " + rs.getString("u_fname") + " " + rs.getString("u_lname") + "\n");
        area.append("Table Number   : " + rs.getString("table_number") + "\n");
        area.append("Booking Status : " + rs.getString("status") + "\n");
        area.append("Booking Time   : " + rs.getString("booking_time") + "\n");
        area.append("\nThank you for your reservation!");
    }

    rs.close();
    pst.close();

} catch (SQLException ex) {
    JOptionPane.showMessageDialog(this, "Error generating receipt: " + ex.getMessage());
    ex.printStackTrace();
}

    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        int selectedRow = tblbooking.getSelectedRow();
    if (selectedRow == -1) {
        JOptionPane.showMessageDialog(this, "Please select a booking to reject.");
        return;
    }
    
    int bookingId = (int) tblbooking.getModel().getValueAt(selectedRow, 0);
    updateBookingStatus(bookingId, "rejected");
    displayBookingData();      // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        adminDashboard usf = new adminDashboard();
        usf.setVisible(true);
        this.dispose();         // TODO add your handling code here:
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // area.setText("");
        //username.setText("");
        //loanamount.setText("");
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        try{
            area.print();
        }catch(Exception e){
        }
    }//GEN-LAST:event_jButton6ActionPerformed

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
            java.util.logging.Logger.getLogger(ViewAllBooking.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ViewAllBooking.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ViewAllBooking.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ViewAllBooking.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ViewAllBooking().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JTextArea area;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    public javax.swing.JButton jButton5;
    public javax.swing.JButton jButton6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblbooking;
    // End of variables declaration//GEN-END:variables
}
