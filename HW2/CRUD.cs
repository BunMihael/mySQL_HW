using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace CRUDExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // Connection string to connect to the MySQL database
            string connectionString = "server=localhost;user=root;password=your_password;database=your_database";
            MySqlConnection connection = new MySqlConnection(connectionString);

            try
            {
                // Open the database connection
                connection.Open();
                Console.WriteLine("Connected to the database.");

                // Create table if it doesn't exist
                string createTableQuery = "CREATE TABLE IF NOT EXISTS customers (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100), email VARCHAR(100))";
                MySqlCommand createTableCommand = new MySqlCommand(createTableQuery, connection);
                createTableCommand.ExecuteNonQuery();

                // Insert data into the table
                string insertQuery = "INSERT INTO customers (name, email) VALUES (@name, @email)";
                MySqlCommand insertCommand = new MySqlCommand(insertQuery, connection);
                insertCommand.Parameters.AddWithValue("@name", "John Doe");
                insertCommand.Parameters.AddWithValue("@email", "john@example.com");
                insertCommand.ExecuteNonQuery();

                // Read data from the table
                string selectQuery = "SELECT * FROM customers";
                MySqlCommand selectCommand = new MySqlCommand(selectQuery, connection);
                MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                Console.WriteLine("Customers:");
                foreach (DataRow row in dataTable.Rows)
                {
                    Console.WriteLine($"ID: {row["id"]}, Name: {row["name"]}, Email: {row["email"]}");
                }

                // Update data in the table
                string updateQuery = "UPDATE customers SET name = @name WHERE id = @id";
                MySqlCommand updateCommand = new MySqlCommand(updateQuery, connection);
                updateCommand.Parameters.AddWithValue("@name", "Jane Smith");
                updateCommand.Parameters.AddWithValue("@id", 1);
                updateCommand.ExecuteNonQuery();

                // Delete data from the table
                string deleteQuery = "DELETE FROM customers WHERE id = @id";
                MySqlCommand deleteCommand = new MySqlCommand(deleteQuery, connection);
                deleteCommand.Parameters.AddWithValue("@id", 2);
                deleteCommand.ExecuteNonQuery();

                Console.WriteLine("Data updated and deleted successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                // Close the database connection
                connection.Close();
                Console.WriteLine("Connection closed.");
            }
        }
    }
}
