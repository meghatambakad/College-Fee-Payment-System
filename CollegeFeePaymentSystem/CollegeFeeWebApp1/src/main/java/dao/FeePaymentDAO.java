package dao;

import model.FeePayment;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FeePaymentDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/collegefeedb";  // change your_db_name
    private String jdbcUsername = "root";  // change if needed
    private String jdbcPassword = "";  // change your_password

    private static final String INSERT_PAYMENT_SQL = "INSERT INTO FeePayments (StudentID, StudentName, PaymentDate, Amount, Status) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_PAYMENT_BY_ID = "SELECT * FROM FeePayments WHERE PaymentID = ?";
    private static final String SELECT_ALL_PAYMENTS = "SELECT * FROM FeePayments";
    private static final String UPDATE_PAYMENT_SQL = "UPDATE FeePayments SET StudentID = ?, StudentName = ?, PaymentDate = ?, Amount = ?, Status = ? WHERE PaymentID = ?";
    private static final String DELETE_PAYMENT_SQL = "DELETE FROM FeePayments WHERE PaymentID = ?";
    
    private static final String SELECT_OVERDUE_PAYMENTS = "SELECT * FROM FeePayments WHERE Status = 'Overdue'";
    private static final String SELECT_PAYMENTS_BY_DATE_RANGE = "SELECT * FROM FeePayments WHERE PaymentDate BETWEEN ? AND ?";

    public FeePaymentDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // load driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Insert new fee payment record
    public void insertPayment(FeePayment fee) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_SQL)) {

            preparedStatement.setString(1, fee.getStudentID());
            preparedStatement.setString(2, fee.getStudentName());
            // Using Timestamp instead of Date to match possible DB type
            preparedStatement.setTimestamp(3, new java.sql.Timestamp(fee.getPaymentDate().getTime()));
            preparedStatement.setDouble(4, fee.getAmount());
            preparedStatement.setString(5, fee.getStatus());

            int rows = preparedStatement.executeUpdate();
            System.out.println("Rows inserted: " + rows);
        }
    }

    // Select payment by PaymentID
    public FeePayment selectPayment(int paymentID) {
        FeePayment payment = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAYMENT_BY_ID)) {

            preparedStatement.setInt(1, paymentID);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                payment = new FeePayment();
                payment.setPaymentID(rs.getInt("PaymentID"));
                payment.setStudentID(rs.getString("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setStatus(rs.getString("Status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    // Select all fee payments
    public List<FeePayment> selectAllPayments() {
        List<FeePayment> payments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PAYMENTS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentID(rs.getInt("PaymentID"));
                payment.setStudentID(rs.getString("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setStatus(rs.getString("Status"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    // Update fee payment record
    public boolean updatePayment(FeePayment fee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PAYMENT_SQL)) {

            preparedStatement.setString(1, fee.getStudentID());
            preparedStatement.setString(2, fee.getStudentName());
            preparedStatement.setDate(3, new java.sql.Date(fee.getPaymentDate().getTime()));
            preparedStatement.setDouble(4, fee.getAmount());
            preparedStatement.setString(5, fee.getStatus());
            preparedStatement.setInt(6, fee.getPaymentID());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete fee payment record
    public boolean deletePayment(int paymentID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PAYMENT_SQL)) {

            preparedStatement.setInt(1, paymentID);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Select overdue payments
    public List<FeePayment> selectOverduePayments() {
        List<FeePayment> payments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_OVERDUE_PAYMENTS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentID(rs.getInt("PaymentID"));
                payment.setStudentID(rs.getString("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setStatus(rs.getString("Status"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    // Select payments by date range
    public List<FeePayment> selectPaymentsByDateRange(Date fromDate, Date toDate) {
        List<FeePayment> payments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAYMENTS_BY_DATE_RANGE)) {

            preparedStatement.setDate(1, new java.sql.Date(fromDate.getTime()));
            preparedStatement.setDate(2, new java.sql.Date(toDate.getTime()));

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                FeePayment payment = new FeePayment();
                payment.setPaymentID(rs.getInt("PaymentID"));
                payment.setStudentID(rs.getString("StudentID"));
                payment.setStudentName(rs.getString("StudentName"));
                payment.setPaymentDate(rs.getDate("PaymentDate"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setStatus(rs.getString("Status"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
}
